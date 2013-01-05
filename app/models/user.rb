class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
	devise :invitable, :database_authenticatable, #:registerable,
		:rememberable, :trackable, :validatable, :recoverable

	# Setup accessible (or protected) attributes for your model
	attr_accessible :email, :password, :password_confirmation, :remember_me, :skip_invitation, :contact_me, :invitation_token, :encrypted_password

	before_update :create_linux_user

	#after_update :do_post_registration_stuff

	def create_linux_user
		if !self.password.nil? 
			if !system("id user_#{self.id}") #create linux user
				system("./user-creation.sh user_#{self.id} #{self.email.shellescape}")
				system("./gateone-password.sh user_#{self.id} #{self.email.shellescape} #{GATEONE_HOME}")
				system("jk_jailuser -m -s /bin/bash -j #{RAILS_APP_DIR } user_#{self.id}")

				port = 1250 + self.id
				cmd = "./post-registration.sh #{self.email} #{RAILS_APP_DIR} #{RUBY_NAME} #{THIS_DOMAIN} #{port} #{APP_HOME} #{self.id} >> #{RAILS_APP_DIR}/home/user_#{self.id}/.post-registration.log 2>&1"
				system(cmd)
				OurMailer.delay.intimate_founders_about_signup(self.email)
				#OurMailer.delay.send_survey_on_app(self.email)
			else #update password
				#system("./user-creation.sh user_#{self.id} #{self.email.shellescape}")
				OurMailer.delay.intimate_user_about_password_update(self.email)
			end
		end

	end

	def self.parse_user_directory(path,rails_dirs)
		puts "parsing #{path}"
		@dirs = Dir.entries(path).select {|f| File.directory? path + "/" + f and f !~ /\..*/ }
		@dirs.each do |d|
			dir = path + "/" + d
			if File.exists?("#{dir}/app") and File.exists?("#{dir}/public") and File.exists?("#{dir}/Gemfile") and File.exists?("#{dir}/Rakefile")
				rails_dirs << dir	
			else 
				parse_user_directory(dir,rails_dirs)
			end
		end

	end

	def self.clean
		out = ""
		User.all.each do |user|
			system("userdel -f #{user.email}")
			system("rm public/#{user.email}")
			user.delete
			user.save
			out += "deleted user #{user.email}"
		end
		#system("./clean-system.sh #{RAILS_APP_DIR}")
		readme = IO.popen("./clean-system.sh #{RAILS_APP_DIR} #{APP_HOME} #{THIS_DOMAIN} 2>&1")
		while readme.gets do
			out += $_
		end
		readme.close
		puts out
	end

	def self.reset
		readme = IO.popen("./reset-system.sh #{RAILS_APP_DIR} #{APP_HOME} #{THIS_DOMAIN} 2>&1")
		while readme.gets do
			puts $_
		end
		readme.close
	end

	def self.migrate_users
		#backing up data
		system("zip -r /tmp/migrate_users.zip /opt/users-rails-apps/home /etc/passwd /etc/shadow")
		User.all.each do |user|
			puts "editing #{user.email}\n"
			system("sed -i 's/#{user.email}/user_#{user.id}/g' /etc/passwd")
			system("sed -i 's/#{user.email}/user_#{user.id}/g' #{RAILS_APP_DIR}/etc/passwd")
			system("sed -i 's/#{user.email}/user_#{user.id}/g' /etc/shadow")

			system("mv #{RAILS_APP_DIR}/home/#{user.email} #{RAILS_APP_DIR}/home/user_#{user.id}")
		end
		system("sed -i '/@/d' /etc/passwd")
		system("sed -i '/@/d' /etc/shadow")
		system("sed -i '/@/d' #{RAILS_APP_DIR}/etc/passwd")

		system("for i in `ls -1 #{RAILS_APP_DIR}/home | grep -v user`; do  rm -rf #{RAILS_APP_DIR}/home/$i; done;")
		system("cp vendor/rails-codelearn #{RAILS_APP_DIR}/bin")
		system("sed -i 's/__THIS_DOMAIN__/#{THIS_DOMAIN}/g' #{RAILS_APP_DIR}/bin/rails-codelearn")

	end


end

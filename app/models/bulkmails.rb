class Bulkmails < ActiveRecord::Base

 # attr_accessible :title, :body
  def self.send_bulk_mails()

    File.open("emails_dir/test_emails_list.txt").each_line{ |s|
      puts s
      User.delay.invite!(:email => s.strip())
    }
  end

    def self.send_signup_intimations()

      File.open("emails_dir/signups_emails.txt").each_line{ |s|
        puts s
        OurMailer.delay.intimate_signups(s.strip())
    }

    end

    def self.bulk_send_console_info()

      File.open("emails_dir/test_emails_list.txt").each_line{ |s|
        puts s
        OurMailer.delay.console_login_info(s.strip())
    }

    end

	def self.send_survey
		User.find(:all, :conditions => 'contact_me = true OR contact_me IS NULL').each do |user|
        	OurMailer.delay.send_survey_on_app(user.email)
		end

	end

  def self.send_Aug3Updates
    User.find(:all, :conditions => 'contact_me = true OR contact_me IS NULL').each do |user|
          OurMailer.delay.Aug3Updates(user.email)
    end

  end

    def self.bulk_send_invites_428()

     File.open("emails_dir/invite_emails_list.txt").each_line{ |s|
      puts s
      User.delay.invite!(:email => s.strip())
    }

    end
    
    def self.re_invite()

     File.open("emails_dir/re-invite.txt").each_line{ |s|
      puts s
      User.delay.invite!(:email => s.strip())
    }

    end

    def self.send_BasicCourseLaunchOct15
          User.find(:all, :conditions => 'contact_me = true OR contact_me IS NULL').each do |user|
            OurMailer.delay.BasicCourseLaunchOct15(user.email)
          end
    end

    def self.send_Module4LaunchOct25
          User.find(:all, :conditions => 'contact_me = true OR contact_me IS NULL').each do |user|
           OurMailer.delay.Module4LaunchOct25(user.email)
          end
    end

    def self.send_LaunchDec12
      User.find(:all, :conditions => 'contact_me = true OR contact_me IS NULL').each do |user|
        OurMailer.delay.LaunchDec12(user.email)
      end
    end

  	def self.send_newsletter(params)
		if !params[:final].nil? and params[:final]
		  User.find(:all, :conditions => 'contact_me = true OR contact_me IS NULL').each do |user|
			NewsletterMailer.delay.send_newsletter(user.email,params[:template],params[:subject])
		  end
		else
			NewsletterMailer.delay.send_newsletter("founders@codelearn.org",params[:template],params[:subject])
		end
	end


	def self.send_mails_to_guys_with_app(params)
		if !params[:final].nil?
			`find /opt/users-rails-apps/home/ -name Gemfile | sed -e "s/.*user_//" | sed -e "s@/.*@@" | uniq `.split("\n").each do |id|
				NewsletterMailer.delay.send_mails_to_guys_with_app(User.find(id).email)
			end
		else
			NewsletterMailer.delay.send_mails_to_guys_with_app("founders@codelearn.org")
		end
	end

end

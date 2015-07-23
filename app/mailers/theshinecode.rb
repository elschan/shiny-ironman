require 'mandrill'
class Theshinecode < ActionMailer::Base

  def confirmation_instructions(record, token, opts={})
    # code to be added here later
  end
  
  def reset_password_instructions(record, token, opts={})
    options = {
      :subject => "Password Reset",
      :email => record.email,
      :global_merge_vars => [
        {
          name: "password_reset_link",
          content: "http://www.example.com/users/password/edit?reset_password_token=#{token}"
        }
      ],
      :template => "Forgot Password"
    }
    mandrill_send options  
  end
  
  def unlock_instructions(record, token, opts={})
    # code to be added here later
  end
  
  def mandrill_send(opts={})
    message = { 
      :subject=> "#{opts[:subject]}", 
      :from_name=> 'shine',
      :from_email=> ENV['shine_email'],
      :to=>
            [{
              "email"=>"#{opts[:email]}",
                "type"=>"to"}],
      :global_merge_vars => opts[:global_merge_vars]
      }
    sending = MANDRILL.messages.send_template opts[:template], [], message
    rescue => e
      Rails.logger.debug("#{e.class}: #{e.message}")
      raise
  end
end

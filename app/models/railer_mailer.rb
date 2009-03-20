class RailerMailer < ActionMailer::Base

  def message(message, users)  
    recipients users
    from "noreply@mouseoverstudio.com"  
    subject "Contato mediante RailersBR"  
    sent_on Time.now
    body :message => message
  end   

end

class RailerMailer < ActionMailer::Base

  def contact(users)  
    recipients users
    from "noreply@mouseoverstudio.com"  
    subject "Contato mediante RailersBR"  
    sent_on Time.now
  end   

end

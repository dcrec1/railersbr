class RailerMailer < ActionMailer::Base

  def message(opts)  
    recipients Railer.all(:conditions => ['city LIKE ? AND email != ?', opts[:city], ""]).collect(&:email)    
    from "noreply@mouseoverstudio.com"  
    subject opts[:subject]
    sent_on Time.now
    body :message => opts[:message]
  end   

end

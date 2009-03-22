require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

# describe RailerMailer do
# 
#   before :all do
#     @emails = ["tic@x.com", "tac@x.com", "toe@x.com"]
#     railers = @emails.collect { |email| Railer.new(:email => email) }
#     city = "Saturn"
#     Railer.stub!(:all).with(:conditions => ['city LIKE ? AND email != ?', city, ""]).and_return(railers)
#     @subject = "We want YOU!"
#     @msg = "Hi, I want you to rock!"
#     @email = RailerMailer.deliver_message(:city => city, :subject => @subject, :message => @msg)
#   end
# 
#   it "should deliver to a list of users" do
#     @email.should deliver_to(@emails)
#   end
# 
#   it "should include the message in the body" do
#     @email.should have_text(/#{@msg}/)
#   end
#   
#   it "should specify the subject" do
#     @email.should have_subject(@subject)
#   end
# 
# end
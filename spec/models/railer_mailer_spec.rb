require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RailerMailer do

  before :all do
    @msg = "Hi, I want you to rock!"
    @users = ["bat@dc.com", "spider@marvel.com"]
    @email = RailerMailer.deliver_message(@msg, @users)
  end

  it "should deliver to a list of users" do
    @email.should deliver_to(@users)
  end

  it "should include the message in the body" do
    @email.should have_text(/#{@msg}/)
  end

end

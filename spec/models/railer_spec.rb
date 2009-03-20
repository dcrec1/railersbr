require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Railer do
  should_have_db_columns :name, :url, :city, :email, :photo_url
  should_validate_presence_of :name, :url, :photo_url
  
  it "should set the photo_url on validation of a new Railer" do
    email = '34534gh34h34'
    railer = Railer.new(:email => email)
    railer.valid?
    railer.photo_url.should eql("http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}?s=150")
  end
  
  it "should not set the photo_url on validation of an existent Railer" do
    railer = Railer.new(:email => 'swgfgweg')
    railer.stub!('new_record?').and_return(false)
    railer.valid?
    railer.photo_url.should be_nil
  end

  it "should contact a list of users specified by id" do
    msg = "work with me"
    emails = ["tic@x.com", "tac@x.com", "toe@x.com"]
    ids = [1,5,7]
    railers = []
    emails.each { |email| railers << Railer.new(:email => email) }
    Railer.stub!(:find).with(ids).and_return(railers)
    RailerMailer.should_receive(:deliver_message).with(msg, emails)
    Railer.contact(ids, msg)
  end
end

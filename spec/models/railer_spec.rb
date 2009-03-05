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
end

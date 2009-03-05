require 'open-uri'

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Manager do

  context "should update the railers database" do
  
    before :each do
      map "person/13580-diego-carrion", "13580-diego-carrion"
    end
  
    it "should update the railers database" do
      map "browse/people/country/Brazil", "Brazil"
      map "person/13522-123", "13522-123"
      Railer.should_receive('create!').exactly(2).times
      Manager.update_railers
    end
    
    it "should create the railers with name, url, city and email" do
      map "browse/people/country/Brazil", "Brazil_dcrec1"
      Railer.should_receive('create!').with(:name => 'Diego Carrion',
                                            :url => 'http://workingwithrails.com/person/13580-diego-carrion',
                                            :city => 'São Paulo',
                                            :email => 'dc.rec1@gmail.com')
      Manager.update_railers
    end
          
    def map(url, file)
      url = "http://workingwithrails.com/#{url}"
      file = File.dirname(__FILE__) + "/../etc/#{file}"
      Kernel.stub!(:open).with(url).and_return(open(file))
    end
  
  end
  
end

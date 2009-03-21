require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RailersController do

  context "responding to GET index" do
    
    it "should paginate 15 railers by the name" do
      page = '4'
      Railer.should_receive(:paginate).with(hash_including(:per_page => 15, :order => 'name'))
      get 'index', :page => page
    end
    
    it "should assign railers with the pagination" do
      value = "432432"
      Railer.stub!(:paginate).and_return(value)
      get 'index'
      assigns[:railers].should eql(value)
    end
    
    it "should filter railers by a given city" do
      city = "Sao Paulo"
      Railer.should_receive(:paginate).with(hash_including(:conditions => ['city LIKE ?', "%#{city}%"]))
      get 'index', :city => city
    end
    
    it "should assume first page case none is specified" do
      Railer.should_receive(:paginate).with(hash_including(:page => 1))
      get 'index'
    end
    
  end
  
  context "routes" do
    
    it "should map root to index action" do
      params_from(:get, "/").should == {:controller => "railers", :action => "index"}
    end
    
    it "should map POST contact to contact action" do
      params_from(:post, "/railers/contact").should == {:controller => "railers", :action => "contact"}
    end
    
  end

end

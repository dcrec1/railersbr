class RailersController < ApplicationController
  
  def index
    page = params[:page] || 1
    @city = params[:city]
    @railers = Railer.paginate :page => page, 
                               :order => "name", 
                               :per_page => 15, 
                               :conditions => ['city LIKE ?', "%#{@city}%"]
  end
  
  def contact
    RailerMailer.deliver_message(params)
    render :file => :nothing
  end
  
end

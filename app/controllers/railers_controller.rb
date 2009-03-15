class RailersController < ApplicationController
  
  def index
    page = params[:page] || 1
    @railers = Railer.paginate :page => page, 
                               :order => "name", 
                               :per_page => 15, 
                               :conditions => ['city LIKE ?', "%#{params[:city]}%"]
  end
  
end

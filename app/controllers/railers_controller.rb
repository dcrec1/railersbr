class RailersController < ApplicationController
  
  def index
    page = params[:page] || 1
    @railers = Railer.paginate :page => page, :order => "name", :size => 15
  end
  
end

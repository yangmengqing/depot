class StoreController < ApplicationController
  def index
    @products = Product.all
    @time = Time.now.strftime("%I:%M %p")
    
    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end
  end
end

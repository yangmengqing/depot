class StoreController < ApplicationController
  skip_before_filter :authorize

  def index
    if params[:set_locale]
      redirect_to store_path(:locale => params[:set_locale])
    else
      @products = Product.all
      @cart = current_cart
      @time = Time.now.strftime("%I:%M %p")
    
      if session[:counter].nil?
        session[:counter] = 1
      else
        session[:counter] += 1
      end
    end
  end
end

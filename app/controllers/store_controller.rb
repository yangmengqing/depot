class StoreController < ApplicationController
  def index
    @products = Product.all
    @time = Time.now.strftime("%I:%M %p")
  end
end

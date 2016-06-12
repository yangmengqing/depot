class AdminController < ApplicationController
  def index
    @total_orders = Order.count
  end

  def for_test
    puts 'test'
  end
end

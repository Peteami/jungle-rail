class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_BASIC_USER'].to_s, password: ENV['HTTP_BASIC_PASSWORD'].to_s

  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end

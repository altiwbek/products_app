class HomeController < ApplicationController
  before_action :set_pagination_values, only: :index


  def index
    @products = Product.includes(image_attachment: :blob)
    @products = @products.where("lower(name) LIKE ?", "%" + params[:search].downcase + "%") if params[:search].present?
    @products = @products.page(@page).per(@per_page)

    respond_to do |format|
      format.html
      format.js
    end
  end
end

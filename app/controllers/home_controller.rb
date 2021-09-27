class HomeController < ApplicationController
  before_action :set_pagination_values, only: :index


  def index
    @products = Product.includes(image_attachment: :blob)
    @products = @products.where("lower(products.name) LIKE ?", "%" + params[:search].downcase + "%") if params[:search].present?
    @products = @products.joins(:product_by_types)
                         .where(product_by_types: {product_type_id: params[:product_type_id]}) if params[:product_type_id].present?
    @products = @products.joins(:manufacturer)
                         .where(manufacturer: {id: params[:manufacturer_id]}) if params[:manufacturer_id].present?
    @products = @products.page(@page).per(@per_page)

    respond_to do |format|
      format.html
      format.js
    end
  end
end

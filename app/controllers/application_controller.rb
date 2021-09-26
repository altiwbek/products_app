class ApplicationController < ActionController::Base
  before_action :set_menu_items

  def set_menu_items
    @product_types = ProductType.includes(:manufacturers)
  end

  def set_pagination_values
    @page = params[:page] || 1
    @per_page = params[:per_page] || 20
  end
end

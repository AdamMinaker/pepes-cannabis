class ApplicationController < ActionController::Base
  before_action :initialize_session
  before_action :load_cart

  def add_to_cart
    id = params[:id].to_i

    #session[:cart] << id unless session[:cart].include?(id)
    #session[:cart] << {id, }
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to root_path
  end

  def add_quantity

  end


  private

  def initialize_session
    session[:cart] ||= {}
  end

  def load_cart
    @cart = Product.all
    #@cart = Product.find(session[:cart])
  end
end

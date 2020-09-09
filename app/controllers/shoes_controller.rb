class ShoesController < ApplicationController
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :shoe_not_found

  def index
    @shoes = Shoe.all
  end

  def show
    @shoe = Shoe.find(params[:id])
  end

  private

  def shoe_not_found
    render plain: 'Shoe not found'
  end
end

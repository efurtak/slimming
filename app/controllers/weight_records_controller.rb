class WeightRecordsController < ApplicationController
  before_action :set_user, only: [:index, :new, :edit, :create, :update]

  def index
    @records = @user.weight_records.order(date: :desc)
  end

  def new
    @record = @user.weight_records.new
  end

  def edit
    @record = @user.weight_records.find(params[:id])
  end

  def create
    @record = @user.weight_records.new(weight_record_params)

    if @record.save
      redirect_to weight_records_path
    else
      render 'new'
    end
  end

  def update
    @record = @user.weight_records.find(params[:id])
    
    if @record.update(weight_record_params)
      redirect_to weight_records_path
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def weight_record_params
    params.require(:weight_record).permit(:date, :weight)
  end
end

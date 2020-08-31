class ReceiptsController < ApplicationController
  before_action :set_receipt, only: [ :show, :edit, :update, :destroy ]

  def show
    @receipt = Receipt.find(params[:id])
    @markers = [@receipt].map do |receipt|
      {
        lat: receipt.latitude,
        lng: receipt.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { receipt: receipt }),
        image_url: helpers.asset_url('picto-papel.png')
      }
    end
  end

  def new
    @receipt = Receipt.new
  end

  def create
    @receipt = Receipt.new(receipt_params)

    @receipt.user = current_user
    if @receipt.save
      redirect_to receipt_path(@receipt), notice: 'Receipt was successfully created.'
    else
      raise
      render :new
    end
  end

  def edit
  end

  def update
    if @receipt.update(receipt_params)
      redirect_to profile_path(current_user), notice: 'Receipt was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @receipt.destroy
    redirect_to profile_path(current_user), notice: 'Receipt was successfully destroyed.'
  end

  def category_list
  end

  private

  def set_receipt
    @receipt = Receipt.find(params[:id])
  end

  def receipt_params
    params.require(:receipt).permit(:title, :date, :store, :amount, :description, :category_name, :user_id, :address)
  end
end

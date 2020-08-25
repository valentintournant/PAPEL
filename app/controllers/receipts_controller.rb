class ReceiptsController < ApplicationController
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]

  def index
    @receipts = Receipt.all
  end

  def show
  end

  def new
    @receipt = Receipt.new
  end

  def create
    @receipt = Receipt.new(receipt_params)
    @receipt.user = current_user
    @receipt.save
    redirect_to receipt_path(@receipt), notice: 'Receipt successfully created.'

  end

  private

  def set_receipt
    @receipt = Receipt.find(params[:id])
  end

  def receipt_params
    params.require(:receipt).permit(:title, :date, :store, :amount, :description, :category_name, :user_id)
  end
end

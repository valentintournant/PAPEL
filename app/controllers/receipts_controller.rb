class ReceiptsController < ApplicationController
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]

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

  def read
    # TODO: (4) recuperer l'id de cloudinary grâce aux params
    @receipt = Receipt.find(params[:id])
    text = ImageReaderService.call(@receipt.photo.key)

    infos = TextParserService.new(text).call # { amount: 34, category_name: '' }
    # TODO Bosser sur le text parser

    redirect_to edit_receipt_path(@receipt, {receipt: infos.compact})
    # TODO: (8) tu rediriges vers l'edit avec les params permettant d'auto-remplir le formulaire
  end

  def new
    @receipt = Receipt.new
  end

  def create
    @receipt = Receipt.new(receipt_params)
    
    # associate cohort to the receipt if there is a cohort
    @cohort = Cohort.find(params[:cohort_id]) if params[:cohort_id].present?
    @receipt.cohort = @cohort
   
    @receipt.user = current_user

    # Receipt added with scan
    if params['scan'] == 'true'
      if @receipt.save(validate: false)
        redirect_to read_receipt_path(@receipt), notice: 'Photo was successfully analyse.'
      else
        render :new
      end
    end
   
     # Receipt manually added
    if @receipt.save
      redirect_to cohort_path(@cohort) if @receipt.cohort
      redirect_to receipt_path(@receipt), notice: 'Receipt was successfully created.'
     else
       render :new
     end
  end

  def edit
    @receipt = Receipt.find(params[:id])
    @receipt.date = Date.today
    receipt_params.each do |key, value|
      @receipt[key] = value
    end

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
    params.require(:receipt).permit(:title, :date, :store, :amount, :description, :category_name, :user_id, :address, :photo, :scan, :cohort_id)
  end
end

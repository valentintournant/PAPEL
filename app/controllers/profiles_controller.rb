class ProfilesController < ApplicationController
  def show
    @user = current_user
    if params.has_key?('category_name')
      @receipts = Receipt.where(category_name: params[:category_name]).where(user: current_user)
    else
      @receipts = current_user.receipts
    end

    if params[:query].present?
      @receipts = @receipts.search_by_store_and_description(params[:query])
    end
  end

  def stats
    @user_expense = current_user.total_receipts
    @user = current_user
    @labels      = []
    @percentages = []

    Receipt::CATEGORIES.each do |key, value|
      @labels << value
      @percentages << (@user.total_receipts_per_category(key).fdiv(@user_expense) * 100).to_i
    end
  end
end

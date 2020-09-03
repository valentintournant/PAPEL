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

  def become_premium
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Premium lifetime subscription for PapeL 🤩
        Thank you for your purchase!",
        amount: 1500,
        currency: 'eur',
        quantity: 1
      }],
      success_url: new_receipt_url,
      cancel_url: new_receipt_url
    )

    current_user.update(checkout_session_id: session.id)
  end

  def stats
    @current_month_number = params[:month].present? ? params[:month] : Time.now.month

    @total_expense = current_user.total_receipts
    @user_expense = current_user.total_amount_for_specific_month(@current_month_number)
    @user = current_user

    @global_stat = !params[:month].present?

    compute_category_percentages

    @receipts_per_month = current_user.receipts_per_month
    @receipt_month_numbers = current_user.receipt_month_numbers
    @monthly_amount = current_user.total_amount_for_specific_month(@current_month_number)
  end

  private

  def compute_category_percentages
    @labels      = []
    @percentages = []

    Receipt::CATEGORIES.each do |category_name, category_label|
      @labels << category_label

      expense = @global_stat ? @total_expense : @user_expense
      next if expense == 0

      if !params[:month].present?
        @percentages << (current_user.total_receipts_per_category(category_name).fdiv(expense) * 100).to_i
      else
        @percentages << (current_user.total_monthly_receipts_per_category(category_name, @current_month_number).fdiv(expense) * 100).to_i
      end

    end

  end
end

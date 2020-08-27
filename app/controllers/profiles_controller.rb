class ProfilesController < ApplicationController
  def show
    @user = current_user
  end

  def stats
    @user_expense = current_user.total_receipts

    @user = current_user

    # @user_expense_category_percentage = current_user.percentage_per_category
    @labels      = []
    @percentages = []

    Receipt::CATEGORIES.each do |key, value|
      @labels << value
      @percentages << (@user.total_receipts_per_category(key).fdiv(@user_expense) * 100).to_i
    end
  end
end

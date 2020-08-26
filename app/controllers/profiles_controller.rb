class ProfilesController < ApplicationController
  def show
    @user = current_user
  end

  def stats
    @user_expense = current_user.total_receipts

    @user = current_user

    # @user_expense_category_percentage = current_user.percentage_per_category
  end
end

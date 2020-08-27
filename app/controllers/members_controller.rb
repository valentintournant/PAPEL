class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def create
    @cohort = Cohort.find(params[:cohort_id])
    @member = Member.new(member_params)
    @member.cohort = @cohort
    if @member.save!
      redirect_to cohort_path(@cohort)
    else
      render 'cohorts/show'
    end
  end

  private
  def member_params
    params.require(:member).permit(:user_id, :status)
  end
end

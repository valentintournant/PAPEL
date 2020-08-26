class CohortsController < ApplicationController
  before_action :set_cohort, only: [:show, :update, :destroy, :edit]
  def index
    @cohorts = current_user.cohorts
  end

  def show
    @member = Member.new
  end

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.save
      Member.create(cohort: @cohort, user: current_user, status: 'owner')
      redirect_to cohorts_path, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cohort.update(cohort_params)
      redirect_to cohorts_path(@cohort), notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @cohort.destroy
    redirect_to cohorts_path, notice: 'Group was successfully destroyed.'
  end

  private

  def set_cohort
    @cohort = Cohort.find(params[:id])
  end

  def cohort_params
    params.require(:cohort).permit(:title, :description)
  end
end

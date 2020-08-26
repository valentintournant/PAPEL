class CohortsController < ApplicationController
  before_action :set_cohort, only: [:show, :update, :destroy, :edit]
  def index
    @cohorts = current_user.cohorts
  end

  def show
  end

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(offer_params)
    @cohort.user = current_user
    if @cohort.save
      redirect_to cohorts_path(@offer), notice: 'Group was successfully created.'
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

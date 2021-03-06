class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:edit, :update, :destroy]
  # check authorization
  authorize_resource
  
  def new
    @registration = Registration.new
  end

  def edit
  end

  def create
    @registration = Registration.new(registration_params)
    if @registration.save
      redirect_to @registration.camp, notice: "The registration of #{@registration.student.name} for #{@registration.camp.name} was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    if @registration.update(registration_params)
      redirect_to @registration.camp, notice: "The registration of #{@registration.student.name} for #{@registration.camp.name} was revised in the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    @registration.destroy
    @student = @registration.student
    @camp = @registration.camp
    redirect_to @camp, notice: "The registration of #{@registration.student.name} for #{@camp.name} was removed from the system."
  end

  private
    def set_registration
      @registration = Registration.find(params[:id])
    end

    def registration_params
      params.require(:registration).permit(:camp_id, :student_id, :payment_status, :points_earned)
    end
end

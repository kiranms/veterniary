class AppointmentsController < ApplicationController

  def index
    @app_creates = Appointment.all
  end

  def new
    @app_create = Appointment.new
  end

  def show
    @app_creates = Appointment.all
  end

  def create
    @app_create = Appointment.new(appointment_params)
    if @app_create.save
      flash[:success] = "Successfully updated"
      redirect_to appointments_path
    else
      flash[:error] = "Something went wrong"
      render :new
    end

  end

  private
  def appointment_params
    params.require(:appointment).permit(:date_of_visit, :customer_id,:pet_id, :requires_reminder, :reason_for_visit, :doctor_id)
  end

end







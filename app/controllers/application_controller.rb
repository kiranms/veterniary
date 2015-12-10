class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def new
  	@app_create = Appointment.new
  end
  def create 
  	@app_create = Appointment.new(user_params)
    if @doctor.save
      flash[:success] = "Successfully updated"
      redirect_to action: :index
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

end

class UsersController < ApplicationController

  def index
    @current_user = User.find(session[:current_user])
    @doctors = @current_user.access_for_doctors
    @appointment_pets = @current_user.pets_through_appointments.uniq
    @all_appointments = @current_user.role == 'receptionist' ? Appointment.where("date_of_visit > ?", Date.current) : []
    @pets = @current_user.pets
  end

  def edit
    @doctor = User.find(params[:id])
  end

  def new
    @doctor = User.new
  end

  def create
    @doctor = User.new(user_params)
    if @doctor.save
      flash[:success] = "Successfully updated"
      redirect_to action: :index
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  def destroy
    @doctor= User.find(params[:id])
    session[:current_user] = nil
  end

  def list
    @doctor = appointment_pets.find(:all)
  end




  def update
    @doctor = User.find(params[:id])
    if @doctor.update_attributes(user_params)
      flash[:success] = "Successfully updated"
      redirect_to action: :index
    else
      flash[:error] = "Something went wrong"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :city, :state, :zip, :school_name, :role, :years_in_practice,:owner, :email, :password)
  end

  # def user1_params
  #   params.require(:user).permit(:name, :address, :city, :state, :zip, :school_name, :role, :years_in_practice,:owner, :email, :password)
  # end

end
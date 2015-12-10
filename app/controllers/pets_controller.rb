class PetsController < ApplicationController

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update_attributes(pet_params)
      flash[:success] = "Successfuly updated"
      redirect_to users_path
    else
      flash[:error] = "Please check for errors"
      render :edit
    end
  end

  private
  def pet_params
    params.require(:pet).permit(:name, :pet_type, :breed, :age, :weight, :date_of_last_visit)
  end
end
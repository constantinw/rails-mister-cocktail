class DosesController < ApplicationController
  def new
    @doses = Dose.new
  end

  def create
      @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to dose_path(@dose)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def cocktail_params
    params.require(:dose).permit(:description)
  end

end

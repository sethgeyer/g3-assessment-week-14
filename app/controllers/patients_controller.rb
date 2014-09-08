class PatientsController < ApplicationController


  def show
    @patient = Patient.find(params[:id].to_i)
    render :show
  end
end
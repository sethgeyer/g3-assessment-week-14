class PatientsController < ApplicationController


  def show
    @patient = Patient.find(params[:id].to_i)
    @prescriptions = @patient.prescriptions
    render :show
  end
end
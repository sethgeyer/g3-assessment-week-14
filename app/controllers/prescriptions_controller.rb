class PrescriptionsController < ApplicationController
  def new
    @prescription = Prescription.new
    @patient = Patient.find(params[:patient_id].to_i)
    # @medication = Medication.all
  end

  def create
    @prescription = Prescription.new
    @prescription.medication_id = params[:prescription][:medication_id]
    @prescription.user_id = current_user.id
    @prescription.patient_id = params[:patient_id]
    @prescription.dosage = params[:prescription][:dosage]
    @prescription.schedule = params[:prescription][:schedule]
    @prescription.start_date = params[:prescription][:start_date]
    @prescription.end_date = params[:prescription][:end_date]

    if @prescription.save
      flash[:notice] = "Your prescription has been created"
      redirect_to patient_path(params[:patient_id])
    else
      flash[:notice] = "Your prescription can not be saved"
      @patient = Patient.find(params[:patient_id].to_i)
      @errors = @prescription.errors.full_messages
      render :new
    end
  end
end
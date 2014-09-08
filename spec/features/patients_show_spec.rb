require 'rails_helper'
require 'capybara/rails'

feature "Patients" do
  before(:each) do
    @user = create_user
    @patient = create_patient
    login(@user)
    visit "/patients/#{@patient.id}"

  end


  scenario "User can see a selected patients's list of prescriptions" do
    expect(page).to have_css("#show-patients")
    expect(page).to have_content "Some Patient"
    expect(page).to have_content "Prescriptions"
  end

  scenario "User can link to add a prescriptions for a patient" do
    click_on "Add Prescription"
    expect(page).to have_css("#new-prescriptions")
  end



end
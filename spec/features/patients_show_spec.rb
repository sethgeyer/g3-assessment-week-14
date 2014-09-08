require 'rails_helper'
require 'capybara/rails'

feature "Patients" do
  before(:each) do
    @user = create_user
    @patient = create_patient
    login(@user)
  end


  scenario "User can see a selected patients's list of prescriptions" do
    visit "/patients/#{@patient.id}"
    expect(page).to have_css("#show-patients")
    expect(page).to have_content "Some Patient"
    expect(page).to have_content "Prescriptions"
  end

end
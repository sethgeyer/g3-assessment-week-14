require 'rails_helper'
require 'capybara/rails'

feature "Prescription" do
  before(:each) do
    @user = create_user
    @patient = create_patient
    login(@user)
    @medication = create_medication
    visit "/patients/#{@patient.id}/prescriptions/new"

  end

  scenario "User can add a prescription for a patient" do
    expect(page).to have_css("#new-prescriptions")
    select "Advil", from: "Medication"
    fill_in "Dosage", with: "2ml"
    fill_in "Schedule", with:"once a day"
    fill_in 'Start date', with: "2015-07-31"
    fill_in 'End date', with: "2015-08-31"
    click_on "Create Prescription"

    expect(page).to have_css("#show-patients")
    expect(page).to have_content("Advil")
    expect(page).to have_content "Your prescription has been created"
  end




end
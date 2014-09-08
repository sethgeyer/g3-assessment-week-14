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
    click_on "Create Prescription"
    fill_in "Dosage", with: "2ml"
    fill_in "Schedule", with:"once a day"
    expect(page).to have_css("#show-patients")
    expect(page).to have_content("Advil")
    expect(page).to have_content "Your prescription has been created"
  end




end
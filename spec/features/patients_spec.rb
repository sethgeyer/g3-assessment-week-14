require 'rails_helper'
require 'capybara/rails'

feature "Patients" do
  before(:each) do
    @user = create_user
    @patient = create_patient
    login(@user)
  end

  scenario "User sees all patients" do
    expect(page).to have_content(@patient.first_name, @patient.last_name)
  end

  scenario "User can link to see a patients's list of prescriptions" do
    click_on "Some Patient"
    expect(page).to have_css("#show-patients")
  end

end
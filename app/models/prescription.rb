class Prescription < ActiveRecord::Base
  belongs_to :medication
  belongs_to :patient
  belongs_to :user

  validates :medication, presence: true
  validates :dosage, presence: true
  validates :schedule, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date
  validate :dosage_not_a_number

  def end_date_after_start_date
    if self[:end_date] == nil ||  self[:end_date] < self[:start_date]
    errors[:end_date] << "must be after start date"
    end
  end

  def dosage_not_a_number
    if self[:dosage] == "" || self[:dosage][0].to_i = 0
      errors[:dosage] << "must start with a number"
    end
  end

end
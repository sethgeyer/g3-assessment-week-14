class AddPrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.integer :user_id
      t.integer :patient_id
      t.integer :medication_id
      t.date :start_date
      t.date :end_date
      t.string :dosage
      t.string :schedule
      t.timestamps
    end
  end
end

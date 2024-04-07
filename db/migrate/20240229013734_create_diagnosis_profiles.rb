class CreateDiagnosisProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :diagnosis_profiles do |t|
      t.references :diagnosis, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end

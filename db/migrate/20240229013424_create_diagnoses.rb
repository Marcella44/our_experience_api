class CreateDiagnoses < ActiveRecord::Migration[7.1]
  def change
    create_table :diagnoses do |t|
      t.string :slug
      t.string :description

      t.timestamps
    end
  end
end

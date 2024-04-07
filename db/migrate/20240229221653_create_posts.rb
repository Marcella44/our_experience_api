class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :forum, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :content
      t.string :subject

      t.timestamps
    end
  end
end

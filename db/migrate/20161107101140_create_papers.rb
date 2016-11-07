class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :title
      t.string :venue
      t.integer :year
      t.references :author, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

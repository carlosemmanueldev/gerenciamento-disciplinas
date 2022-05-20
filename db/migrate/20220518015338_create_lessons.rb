class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :description
      t.date :delivery_date
      t.integer :bimester
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end

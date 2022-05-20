class CreateClassrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :classrooms do |t|
      t.string :school_year
      t.string :letter
      t.integer :year
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

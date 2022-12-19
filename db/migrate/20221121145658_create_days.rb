class CreateDays < ActiveRecord::Migration[7.0]
  def change
    create_table :days do |t|
      t.integer :day_name, null: false, unique: true
      t.time :begin_turn, null: false
      t.time :end_turn, null: false
      t.references :branch_office, null: false, foreign_key: true
      t.timestamps
    end
  end
end

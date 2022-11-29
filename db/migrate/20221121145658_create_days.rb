class CreateDays < ActiveRecord::Migration[7.0]
  def change
    create_table :days do |t|
      t.string :day_name
      t.time :begin_turn
      t.time :end_turn
      t.references :branch_office, null: false, foreign_key: true
      t.timestamps
    end
  end
end

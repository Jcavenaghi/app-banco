class CreateDays < ActiveRecord::Migration[7.0]
  def change
    create_table :days do |t|
      t.string :day_name
      t.datetime :inicio_turno
      t.datetime :fin_turno
      t.references :sucursale, null: false, foreign_key: true
      t.timestamps
    end
  end
end

class CreateTurns < ActiveRecord::Migration[7.0]
  def change
    create_table :turns do |t|
      t.datetime :inicio_turno
      t.datetime :fin_turno

      t.timestamps
    end
  end
end

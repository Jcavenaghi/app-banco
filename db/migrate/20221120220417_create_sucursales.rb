class CreateSucursales < ActiveRecord::Migration[7.0]
  def change
    create_table :sucursales do |t|
      t.string :name
      t.string :direc
      t.integer :tel

      t.timestamps
    end
  end
end

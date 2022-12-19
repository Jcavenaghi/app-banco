class CreateBranchOffices < ActiveRecord::Migration[7.0]
  def change
    create_table :branch_offices do |t|
      t.string :name, null: false
      t.string :direc, null: false
      t.integer :tel, null: false

      t.timestamps
    end
  end
end

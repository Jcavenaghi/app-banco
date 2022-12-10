class CreateTurns < ActiveRecord::Migration[7.0]
  def change
    create_table :turns do |t|
      t.datetime :fecha
      t.string :reason
      t.boolean :state, default: false
      t.string :comment
      t.references :client_user, null: false
      t.references :staff_user, null: true
      t.references :branch_office, null: false

      t.timestamps
    end
    add_foreign_key :turns, :users, column: :client_user_id
    add_foreign_key :turns, :admin_users, column: :staff_user_id
    add_foreign_key :turns, :branch_offices, column: :branch_office_id
  end
end

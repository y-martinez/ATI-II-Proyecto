class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :name
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.string :type
      t.timestamp :time_of_reservation

      t.timestamps null: false
    end
  end
end

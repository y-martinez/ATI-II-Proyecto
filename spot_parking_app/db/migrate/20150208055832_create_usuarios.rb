class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :email
      t.string :name
      t.string :password
      t.date :date_creation
      t.string :type
      t.timestamp :time_of_reservation
      t.timestamps null: false
    end
  end
end

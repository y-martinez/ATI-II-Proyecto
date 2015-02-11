class CreateHistorials < ActiveRecord::Migration
  def change
    create_table :historials do |t|
      t.integer :user_id
      t.timestamp :enter_time
      t.timestamp :exit_time
      t.float :payment
      #No estoy seguro de como es el peo de la relacion en este caso, ver http://guides.rubyonrails.org/association_basics.html
      t.timestamps null: false
    end
  end
end

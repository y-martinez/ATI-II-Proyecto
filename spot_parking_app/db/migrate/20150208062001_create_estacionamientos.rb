class CreateEstacionamientos < ActiveRecord::Migration
  def change
    create_table :estacionamientos do |t|
      t.interger :id
      t.integer :number_posts
      t.integer :number_floors
      t.float :price

      t.timestamps null: false
    end
  end
end

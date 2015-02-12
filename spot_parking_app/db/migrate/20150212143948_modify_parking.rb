class ModifyParking < ActiveRecord::Migration
  def change
  	remove_column :parking , :number_posts
  	remove_column :parking , :number_floors
  	add_column :parking , :location , :string
  end
end

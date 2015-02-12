class CreateFloors < ActiveRecord::Migration
  def change
    create_table :floors do |t|
    	t.integer :number_posts
    	t.timestamps null: false
    end
  end
end

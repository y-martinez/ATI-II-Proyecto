class ChangeNamesTables < ActiveRecord::Migration
  def change
  	rename_table :usuarios , :users
  	rename_table :estacionamientos , :parking
  	rename_table :historials , :records
  end
end

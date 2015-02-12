class ModifyUser < ActiveRecord::Migration
  def change
  	rename_column :users , :type , :type_of_user
  end
end

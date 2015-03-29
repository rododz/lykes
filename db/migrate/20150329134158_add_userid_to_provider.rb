class AddUseridToProvider < ActiveRecord::Migration
  def change
  	add_column :providers, :user_id, :string
  end
end

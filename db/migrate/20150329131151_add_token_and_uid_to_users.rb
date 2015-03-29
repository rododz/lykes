class AddTokenAndUidToUsers < ActiveRecord::Migration
  def change
  	add_column :providers, :uid, :string
  	add_column :providers, :token, :string
  end
end

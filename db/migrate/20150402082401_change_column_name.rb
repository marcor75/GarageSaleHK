class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :orders, :Seller_id, :seller_id
  end
end

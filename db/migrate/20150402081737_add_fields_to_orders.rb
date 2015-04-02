class AddFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :buyer_id, :integer
    add_column :orders, :Seller_id, :integer
  end
end

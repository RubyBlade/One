class AddPriceToLineItems < ActiveRecord::Migration[7.0]
  def up
    add_column :line_items, :price, :decimal, precision: 8, scale: 2

    LineItem.reset_column_information

    LineItem.find_each do |line_item|
      line_item.update_columns(price: line_item.product.price)
    end
  end

  def down
    remove_column :line_items, :price
  end
end

class AddDescriptionToLineItem < ActiveRecord::Migration[7.0]
  def change
    add_column :line_items, :description, :text
  end
end

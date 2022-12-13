class AddStartTimeToLineItem < ActiveRecord::Migration[7.0]
  def change
    add_column :line_items, :start_time, :time, limit: 3
  end
end

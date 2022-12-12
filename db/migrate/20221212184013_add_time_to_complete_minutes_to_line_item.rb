class AddTimeToCompleteMinutesToLineItem < ActiveRecord::Migration[7.0]
  def change
    add_column :line_items, :time_to_complete_minutes, :integer
  end
end

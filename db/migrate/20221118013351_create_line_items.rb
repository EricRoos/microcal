class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items, id: :uuid do |t|
      t.string :text
      t.boolean :completed, default: false
      t.date :date

      t.timestamps
    end
  end
end

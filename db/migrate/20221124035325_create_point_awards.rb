class CreatePointAwards < ActiveRecord::Migration[7.0]
  def change
    create_table :point_awards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end

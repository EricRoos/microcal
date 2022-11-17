class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :type
      t.references :user, null: false, foreign_key: true
      t.jsonb :meta, default: '{}'

      t.timestamps
    end
  end
end

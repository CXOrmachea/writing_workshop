class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.text :link
      t.references :user

      t.timestamps
    end
    add_index :readings, :user_id
  end
end

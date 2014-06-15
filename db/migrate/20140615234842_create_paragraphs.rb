class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.references :story
      t.text :body

      t.timestamps
    end
    add_index :paragraphs, :story_id
  end
end

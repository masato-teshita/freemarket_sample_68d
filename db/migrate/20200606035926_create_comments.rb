class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :item, foreign_key: true
      t.bigint :user_id, foreign_key: true
      t.integer :user_id
      t.integer :item_id
      t.text :text
      t.timestamps
      
    end
  end
end

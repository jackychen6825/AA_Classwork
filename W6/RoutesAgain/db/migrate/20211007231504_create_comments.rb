class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :commenter_id, null: false
      t.integer :artwork_id, null: false
      t.string :body, null: false
    end
    add_index :comments, :commenter_id
    add_index :comments, :artwork_id
  end
end

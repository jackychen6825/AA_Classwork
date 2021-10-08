class CreateArtworkShare < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_shares do |t|
      t.integer :artwork_id, null: false
      t.integer :viewer_id, null: false
    end

    add_index :artwork_shares, [:artwork_id, :viewer_id], unique: true 

  end
end

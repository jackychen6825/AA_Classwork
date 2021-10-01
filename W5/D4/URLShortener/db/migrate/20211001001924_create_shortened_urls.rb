class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.text :long_url, null: false 
      t.text :short_url, null: false 
      t.timestamps
    end

    add_index :shortened_urls, :short_url, unique: true
    
  end
end

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, not: :null
      t.timestamps
    end

    add_index(:users, :email, unique: true)
  end
end

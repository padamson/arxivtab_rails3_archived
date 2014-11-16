class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.string :url
      t.integer :user_id

      t.timestamps
    end
    add_index :docs
  end
end

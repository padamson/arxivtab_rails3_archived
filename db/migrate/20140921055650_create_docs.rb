class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.string :url
      t.datetime :tabbed_at

      t.timestamps
    end
    add_index :docs, :tabbed_at
  end
end

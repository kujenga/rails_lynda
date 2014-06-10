class CreateSections < ActiveRecord::Migration
  def up
    create_table :sections do |t|
      t.string "name", :limit => 50
      t.integer "position"
      t.boolean "visible", :default => false
      t.string "content_type", :limit => 25
      t.text "content"

      t.integer "page_id"

      t.timestamps
    end
  end
  def down
    drop_table :sections
  end
end

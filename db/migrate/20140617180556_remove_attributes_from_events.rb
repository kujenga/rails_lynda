class RemoveAttributesFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :name, :string
    remove_column :events, :location, :string
    remove_column :events, :time, :datetime
  end
end

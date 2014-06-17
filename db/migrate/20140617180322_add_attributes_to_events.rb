class AddAttributesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :title, :string
    add_column :events, :description, :string
    add_column :events, :institution, :string
    add_column :events, :public, :boolean
    add_column :events, :start_date, :datetime
    add_column :events, :end_date, :datetime
  end
end

class AddColumnsToResources < ActiveRecord::Migration
  def change
  	add_column :resources, :mime_type, :string
  	add_column :resources, :size, :integer
  end
end

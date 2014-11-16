class AddDataToResources < ActiveRecord::Migration
  def change
  	add_column :resources, :data, :binary
  end
end

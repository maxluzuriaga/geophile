class ChangeEventDatetimesToDates < ActiveRecord::Migration
  def up
  	change_column :events, :start, :date
  	change_column :events, :end, :date
  end

  def down
  	change_column :events, :start, :datetime
  	change_column :events, :end, :datetime
  end
end

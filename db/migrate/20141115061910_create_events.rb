class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start
      t.datetime :end
      t.integer :user_id
      t.float :latitude
      t.float :longitude
      t.integer :radius

      t.timestamps
    end
  end
end

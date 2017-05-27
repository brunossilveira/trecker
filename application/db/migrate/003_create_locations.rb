class CreateLocations < ActiveRecord::Migration[5.0]
  def self.up
    create_table :locations do |t|
      t.datetime :timestamp
      t.st_point :location, geographic: true
      t.float :speed
      t.string :activity

      t.references :driver
      t.references :company
    end

    change_table :locations do |t|
      t.index :timestamp
    end
  end
end

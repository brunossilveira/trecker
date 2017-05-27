class CreateFields < ActiveRecord::Migration[5.0]
  def self.up
    create_table :fields do |t|
      t.string :name

      t.st_polygon :polygon, geographic: true

      t.references :company
    end
  end
end

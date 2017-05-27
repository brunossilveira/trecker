class CreateDrivers < ActiveRecord::Migration[5.0]
  def self.up
    create_table :drivers do |t|
      t.string :name

      t.references :company
    end
  end
end

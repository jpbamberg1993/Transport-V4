class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.string :origin
      t.string :destination
      t.string :mode_of_transportation
      t.string :equipment_type
      t.integer :minimum_commitment
      t.integer :maximum_commitment
      t.integer :cost
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

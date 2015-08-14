class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.string :origin
      t.string :destination
      t.string :mode_of_transportation
      t.string :equipment_type
      t.string :minimum_commitment
      t.string :maximum_commitment
      t.string :cost

      t.timestamps null: false
    end
  end
end

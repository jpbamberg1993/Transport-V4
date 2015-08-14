class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :amount
      t.references :user, index: true, foreign_key: true
      t.references :shipment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

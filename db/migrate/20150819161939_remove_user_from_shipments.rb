class RemoveUserFromShipments < ActiveRecord::Migration
  def change
    remove_reference :shipments, :user, index: true, foreign_key: true
  end
end

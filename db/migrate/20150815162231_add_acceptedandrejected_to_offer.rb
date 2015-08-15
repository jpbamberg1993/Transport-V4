class AddAcceptedandrejectedToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :accepted, :boolean
    add_column :offers, :rejected, :boolean
  end
end

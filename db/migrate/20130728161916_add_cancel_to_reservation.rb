class AddCancelToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :cancelled, :boolean, :default => false
  end
end

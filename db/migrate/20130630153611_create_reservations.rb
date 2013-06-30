class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user
      t.references :device
      t.datetime   :start_at
      t.datetime   :end_at
      t.string     :state
      t.timestamps
    end
  end
end

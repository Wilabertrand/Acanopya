class AddColumnToBookingActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :booking_activities, :status_reservation, :string, default: "pending"
  end
end

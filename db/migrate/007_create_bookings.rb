class CreateBookings < ActiveRecord::Migration[5.0]
    def change
        create_table :bookings do |t|
            t.integer :user_id
            t.integer :exhibition_id
            t.string :reference_number
        end
    end
end
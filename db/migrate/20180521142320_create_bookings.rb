class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :flight, foreign_key: true
      t.string :status
      t.text :comments

      t.timestamps
    end
  end
end

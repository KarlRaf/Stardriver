class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.references :rocket, foreign_key: true
      t.date :date
      t.string :destination
      t.string :departure
      t.text :description

      t.timestamps
    end
  end
end

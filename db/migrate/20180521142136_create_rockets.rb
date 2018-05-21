class CreateRockets < ActiveRecord::Migration[5.2]
  def change
    create_table :rockets do |t|
      t.string :capacity
      t.string :model
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

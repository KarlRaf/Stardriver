class ChangingRocketCapacityToInt < ActiveRecord::Migration[5.2]
  def change
    change_column :rockets, :capacity, :int, using: 'capacity::integer'
  end
end

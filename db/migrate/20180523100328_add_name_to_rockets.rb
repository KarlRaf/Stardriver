class AddNameToRockets < ActiveRecord::Migration[5.2]
  def change
    add_column :rockets, :name, :string
  end
end

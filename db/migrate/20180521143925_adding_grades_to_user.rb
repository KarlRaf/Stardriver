class AddingGradesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :grades, :int
  end
end

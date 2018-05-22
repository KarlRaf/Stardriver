class AddPhotoToRockets < ActiveRecord::Migration[5.2]
  def change
    add_column :rockets, :photo, :string
  end
end

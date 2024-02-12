class AddImageToTravels < ActiveRecord::Migration[6.1]
  def change
    add_column :travels, :image, :string
  end
end

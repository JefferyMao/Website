class AddUserIdToTravels < ActiveRecord::Migration[6.1]
  def change
    add_column :travels, :user_id, :integer
  end
end

class CreateTravels < ActiveRecord::Migration[6.1]
  def change
    create_table :travels do |t|
      t.text :body

      t.timestamps
    end
  end
end

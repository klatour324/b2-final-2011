class AddTimeColumnToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :time, :string
  end
end

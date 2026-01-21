class AddDateToFlights < ActiveRecord::Migration[8.1]
  def change
    add_column :flights, :departure_date, :date
  end
end

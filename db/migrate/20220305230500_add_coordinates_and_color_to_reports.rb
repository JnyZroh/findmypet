class AddCoordinatesAndColorToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :latitude, :float
    add_column :reports, :longitude, :float
    add_column :reports, :color, :string
  end
end

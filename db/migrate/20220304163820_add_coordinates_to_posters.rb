class AddCoordinatesToPosters < ActiveRecord::Migration[6.1]
  def change
    add_column :posters, :latitude, :float
    add_column :posters, :longitude, :float
  end
end

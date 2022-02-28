class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.date :date_spotted
      t.string :address
      t.string :species
      t.text :description
      t.string :type

      t.timestamps
    end
  end
end

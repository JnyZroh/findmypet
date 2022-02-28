class CreatePosters < ActiveRecord::Migration[6.1]
  def change
    create_table :posters do |t|
      t.date :date_missing
      t.date :date_found
      t.boolean :found
      t.text :comment
      t.integer :reward
      t.integer :radius
      t.string :address
      t.references :pet, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

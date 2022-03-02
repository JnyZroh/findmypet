class RemoveUserFromPosters < ActiveRecord::Migration[6.1]
  def change
    remove_reference :posters, :user, null: false, foreign_key: true
  end
end

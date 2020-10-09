class RemoveBioFromSongs < ActiveRecord::Migration[5.0]
  def change
    remove_column :songs, :bio, :text
  end
end

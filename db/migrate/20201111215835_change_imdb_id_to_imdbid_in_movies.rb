class ChangeImdbIdToImdbidInMovies < ActiveRecord::Migration[6.0]
  def change
    change_table :movies do |t|
      t.rename :imdbID, :imdbid 
    end
  end
end

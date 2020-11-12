class CapitalizePlotInMovies < ActiveRecord::Migration[6.0]
  def change
    change_table :movies do |t|
      t.rename :plot, :plot
    end
  end
end

class RemoveReviewIdAndAddMovieId < ActiveRecord::Migration[6.0]
  def change
    rename_column :likes, :review_id, :movie_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end

class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user_id, null: false, foreign_key: true
      t.belongs_to :review_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end

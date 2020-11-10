class CreateStudios < ActiveRecord::Migration[6.0]
  def change
    create_table :studios do |t|

      t.timestamps
    end
  end
end

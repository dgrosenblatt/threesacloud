class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|

      t.text :comment, null: false
      t.integer :rating, null: false
      t.integer :user_id, null: false
      t.integer :weather_id, null: false

      t.timestamps null: false
    end
  end
end

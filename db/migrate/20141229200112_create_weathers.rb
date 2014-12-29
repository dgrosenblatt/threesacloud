class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.string :city, null: false
      t.string :state, null: false
      t.datetime :date, null: false
      t.string :conditions, null: false
      t.string :feel, null: false

      t.timestamps null: false
    end

    add_index :weathers, [:city, :date], unique: true
  end
end

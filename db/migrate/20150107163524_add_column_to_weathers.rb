class AddColumnToWeathers < ActiveRecord::Migration
  def change
    add_column :weathers, :icon_url, :string
  end
end

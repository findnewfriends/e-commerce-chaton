class AddUrlToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :url, :text
  end
end

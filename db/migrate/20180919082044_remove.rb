class Remove < ActiveRecord::Migration[5.1]
  def change
    remove_column :pictures, :cintent, :text
    add_column :pictures, :content, :text
  end
end

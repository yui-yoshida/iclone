class AddNameToPictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string "image"
      t.text "content"
      t.references :user
      
      t.timestamps
    end
  end
end

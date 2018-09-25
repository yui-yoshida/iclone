class AddUsersToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :user, :references
  end
end

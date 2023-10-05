class RemoveLikeFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :like
    remove_column :comments, :like
  end
end

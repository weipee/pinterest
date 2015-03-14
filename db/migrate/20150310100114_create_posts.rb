class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :image
      t.text :body
      t.belongs_to :user
      t.integer :post_votes_count, default: 0

      t.timestamps
    end
  end
end

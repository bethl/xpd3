class AddContentsToNewsBlasts < ActiveRecord::Migration
  def self.up
    add_column :news_blasts, :content1, :string
    add_column :news_blasts, :content2, :string
    add_column :news_blasts, :content3, :string
    add_column :news_blasts, :content4, :string
    add_column :news_blasts, :content5, :string
    add_column :news_blasts, :content6, :string
    add_column :news_blasts, :content7, :string
  end

  def self.down
    remove_column :news_blasts, :content7
    remove_column :news_blasts, :content6
    remove_column :news_blasts, :content5
    remove_column :news_blasts, :content4
    remove_column :news_blasts, :content3
    remove_column :news_blasts, :content2
    remove_column :news_blasts, :content1
  end
end

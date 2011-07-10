class CreateNewsBlasts < ActiveRecord::Migration
  def self.up
    create_table :news_blasts do |t|
      t.date :date
      t.string :author

      t.timestamps
    end
  end

  def self.down
    drop_table :news_blasts
  end
end

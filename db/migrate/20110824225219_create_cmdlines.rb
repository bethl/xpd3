class CreateCmdlines < ActiveRecord::Migration
  def self.up
    create_table :cmdlines do |t|
      t.string :cmd
      t.string :response

      t.timestamps
    end
  end

  def self.down
    drop_table :cmdlines
  end
end

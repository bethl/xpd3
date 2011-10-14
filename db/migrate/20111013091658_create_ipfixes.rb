class CreateIpfixes < ActiveRecord::Migration
  def self.up
    create_table :ipfixes do |t|
      t.string :host
      t.string :ip

      t.timestamps
    end
  end

  def self.down
    drop_table :ipfixes
  end
end

class CreateExternalAccounts < ActiveRecord::Migration
  def self.up
    create_table :external_accounts do |t|
      t.string :name
      t.string :link
      t.string :username
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :external_accounts
  end
end

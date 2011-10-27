class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.string :company_name
      t.string :website
      t.string :account
      t.string :username
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :suppliers
  end
end

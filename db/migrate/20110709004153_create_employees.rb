class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.integer :employeeid
      t.string :name
      t.string :position_title
      t.date :origin_date
      t.date :dob

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end

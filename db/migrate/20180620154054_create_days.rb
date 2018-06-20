class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :month
      t.integer :date
      t.integer :year
    end
  end
end

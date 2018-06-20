class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :date
      t.string :month
      t.integer :year
    end
  end
end

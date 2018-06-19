class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :day_off
      t.integer :user_id
    end
  end
end

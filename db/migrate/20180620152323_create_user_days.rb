class CreateUserDays < ActiveRecord::Migration
  def change
    create_table :user_days do |t|
      t.integer :day_id
      t.integer :user_id
    end
  end
end

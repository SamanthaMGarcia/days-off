class CreateUserDays < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :pencil_id
      t.integer :user_id
  end
end

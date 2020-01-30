class CreateSub < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :type
      t.integer :amount
      t.integer :frequency
      t.integer :user_id
    end
  end

  def change 
    alter_table :subscriptions do |t|
      t.string :frequency
  end 
end

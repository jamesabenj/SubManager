class CreateSub < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :type
      t.float :amount
      t.string :frequency
      t.integer :user_id
    end
  end

 
end

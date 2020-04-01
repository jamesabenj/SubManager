class ChangeTypeColumn < ActiveRecord::Migration
  def change
    rename_column :subscriptions, :type, :sub_type
  end
end

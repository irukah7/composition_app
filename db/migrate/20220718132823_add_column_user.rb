class AddColumnUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_id, :integer, null: false
    add_column :users, :relation_user_id, :integer
    add_column :users, :relation_cd, :string
    add_column :users, :user_name, :string
    add_column :users, :birthday, :date
    add_column :users, :hobby, :string
    add_column :users, :comment, :text
    add_column :users, :gazo, :string
    add_column :users, :update_date, :datetime

  end
end
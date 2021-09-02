class AddDetailsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postal_code, :integer
    add_column :users, :adress, :text
    add_column :users, :self_introduction, :text
  end
end

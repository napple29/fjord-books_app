# frozen_string_literal: true

class RenameAdressColumnToUser < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :adress, :address
  end
end

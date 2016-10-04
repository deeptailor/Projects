class AddColumn < ActiveRecord::Migration
  def change
    add_column :cats, :created_at, :timestamp
    add_column :cats, :updated_at, :timestamp
  end
end

class AddManagerToRole < ActiveRecord::Migration
  def change
    add_column :roles, :manager, :boolean, :default => false
  end
end

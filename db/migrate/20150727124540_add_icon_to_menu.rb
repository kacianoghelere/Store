class AddIconToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :icon, :string
  end
end

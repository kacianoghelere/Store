class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.belongs_to :role,     index: true
      t.belongs_to :page,     index: true
      t.boolean :can_create,  default: false
      t.boolean :can_read,    default: false
      t.boolean :can_update,  default: false
      t.boolean :can_destroy, default: false

      t.timestamps null: false
    end
  end
end

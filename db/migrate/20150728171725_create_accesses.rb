class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.belongs_to :role, index: true
      t.belongs_to :page, index: true
      t.boolean :can_create
      t.boolean :can_read
      t.boolean :can_update
      t.boolean :can_destroy

      t.timestamps null: false
    end
  end
end

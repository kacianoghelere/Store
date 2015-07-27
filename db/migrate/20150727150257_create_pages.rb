class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :icon
      t.string :path
      t.belongs_to :menu, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.belongs_to :user, index: true
      t.string :name, null: false
      t.string :isbn, null: false
      t.boolean :reserved, default: false

      t.timestamps null: false
    end

    add_index :books, :name
    add_index :books, :isbn, unique: true
  end
end

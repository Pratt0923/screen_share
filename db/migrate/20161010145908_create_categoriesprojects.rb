class CreateCategoriesprojects < ActiveRecord::Migration[5.0]
  def change
    create_table :categoriesprojects do |t|
      t.integer :chatroom_id
      t.string :language_id
      t.timestamps
    end
  end
end

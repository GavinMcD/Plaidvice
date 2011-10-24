class CreateNuggets < ActiveRecord::Migration
  def change
    create_table :nuggets do |t|
      t.string  :audience
      t.string  :topic
      t.text    :body
      t.integer :user_id

      t.timestamps
    end
    add_index :nuggets, :user_id
    add_index :nuggets, :audience
    add_index :nuggets, :topic
  end
end

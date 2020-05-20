class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :topic_id, null: false
      t.string :token
      t.string :name
      t.string :body

      t.timestamps null: false
    end
  end
end

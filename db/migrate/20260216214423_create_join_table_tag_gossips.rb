class CreateJoinTableTagGossips < ActiveRecord::Migration[8.0]
  def change
    create_table :join_table_tag_gossips do |t|
      t.references :gossip, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end

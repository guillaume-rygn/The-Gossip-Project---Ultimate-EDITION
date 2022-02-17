class CreateJoinTableGossipTags < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_gossip_tags do |t|

      t.timestamps
    end
  end
end

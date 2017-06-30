class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :votable_id, null: false
      t.string :votable_type, null: false
      t.integer :voter_id, null: false
      t.integer :vote_direction
      t.timestamps
    end
  end
end

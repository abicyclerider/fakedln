class CreateFollows < ActiveRecord::Migration[8.0]
  def change
    create_table :follows do |t|
      t.integer :follower_id, null: false
      t.integer :followed_id, null: false

      t.timestamps
    end

    # Add indexes for faster lookups
    add_index :follows, :follower_id
    add_index :follows, :followed_id

    # Ensure a user can't follow the same person twice
    add_index :follows, [ :follower_id, :followed_id ], unique: true

    # Foreign key constraints
    add_foreign_key :follows, :users, column: :follower_id
    add_foreign_key :follows, :users, column: :followed_id
  end
end

class CreatePullRequests < ActiveRecord::Migration
  def change
    create_table :pull_requests, id: :uuid  do |t|
      t.timestamps null: false

      t.timestamp :approved_at
      t.string :link,  null: false
      t.string :message,  null: false
      t.references :team, type: :uuid, index: true, foreign_key: true, null: false
      t.references :channel, type: :uuid, index: true, foreign_key: true, null: false
      t.references :user, type: :uuid, index: true, foreign_key: true, null: false
    end
  end
end

class ChannelBelongsToTeam < ActiveRecord::Migration
  def change
    change_table :channels do |t|
      t.references :team, type: :uuid, index: true, foreign_key: true, null: false
    end
  end
end

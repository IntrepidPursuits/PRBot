class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels, id: :uuid do |t|
      t.timestamps null: false

      t.string :slack_channel_id, null: false
      t.string :name, null: false
    end
  end
end

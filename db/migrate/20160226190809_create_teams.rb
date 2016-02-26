class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams, id: :uuid do |t|
      t.timestamps null: false

      t.string :slack_team_id, null: false
      t.string :domain, null: false
    end
  end
end

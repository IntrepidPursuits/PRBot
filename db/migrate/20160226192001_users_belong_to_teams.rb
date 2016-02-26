class UsersBelongToTeams < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :team, type: :uuid, index: true, foreign_key: true, null: false
    end
  end
end

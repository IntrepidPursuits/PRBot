class CreateUsers < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'

    create_table :users, id: :uuid do |t|
      t.timestamps null: false

      t.string :slack_user_id, null: false
      t.string :name, null: false
    end
  end
end

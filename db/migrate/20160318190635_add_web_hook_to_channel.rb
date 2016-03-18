class AddWebHookToChannel < ActiveRecord::Migration
  def change
    change_table :channels do |t|
      t.string :web_hook
    end
  end
end

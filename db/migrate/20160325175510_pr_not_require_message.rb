class PrNotRequireMessage < ActiveRecord::Migration
  def change
    change_column :pull_requests, :message, :string, null: true
  end
end

class AddApproverToPr < ActiveRecord::Migration
  def change
    change_table :pull_requests do |t|
      t.references :approver, type: :uuid, index: true
    end
  end
end

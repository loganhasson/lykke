class AddPrivateToSummaries < ActiveRecord::Migration
  def change
    add_column :summaries, :private, :boolean
  end
end

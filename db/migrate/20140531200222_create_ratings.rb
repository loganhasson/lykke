class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :summary_id
      t.integer :rank

      t.timestamps
    end
  end
end

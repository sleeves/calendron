class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :calendar
      t.string :title
      t.datetime :start_point
      t.datetime :end_point

      t.timestamps
    end
    add_index :events, :calendar_id
  end
end

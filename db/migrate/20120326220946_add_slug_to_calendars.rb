class AddSlugToCalendars < ActiveRecord::Migration
  def change
    add_column :calendars, :slug, :string
    add_index :calendars, :slug, unique: true
  end
end

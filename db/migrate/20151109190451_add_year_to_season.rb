class AddYearToSeason < ActiveRecord::Migration
  def change
    add_column :seasons, :year, :integer
  end
end

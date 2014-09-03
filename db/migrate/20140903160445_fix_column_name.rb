class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :players, :NFL_team, :nfl_team
  end
end

class AddNflTeamToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :NFL_team, :string
    add_column :players, :pos, :string
  end
end

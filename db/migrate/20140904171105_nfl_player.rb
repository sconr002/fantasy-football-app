class NflPlayer < ActiveRecord::Migration
  def change
    create_table :nfl_players do |t|
      t.string :name
      t.string :pos
      t.string :team
      t.timestamps
    end
  end
end

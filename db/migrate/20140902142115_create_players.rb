class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.belongs_to :team
      t.string :name
      t.boolean :injured, default: false
      t.boolean :bye, default: false
      t.timestamps
    end
  end
end

class CreateConcertsTable < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :artist
      t.date :date
      t.timestamps
    end
  end
end

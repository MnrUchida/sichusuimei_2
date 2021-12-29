class CreateSeason < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.datetime :division_date, null: false
      t.integer :year
      t.integer :month
      t.decimal :seconds

      t.timestamps
    end
  end
end

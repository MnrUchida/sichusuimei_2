class CreatePillarOfYear < ActiveRecord::Migration[6.0]
  def change
    create_table :pillar_of_years do |t|
      t.belongs_to :person
      t.integer :tenkan, null: false
      t.integer :chishi, null: false
      t.integer :zoukan, null: false
    end
  end
end

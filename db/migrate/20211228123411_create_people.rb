class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.datetime :datetime_of_birth, null: false
      t.integer :sex, null: false
    end
  end
end

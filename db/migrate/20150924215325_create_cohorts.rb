class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :name, null: false
      t.belongs_to :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

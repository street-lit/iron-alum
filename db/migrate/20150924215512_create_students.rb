class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.belongs_to :cohort, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

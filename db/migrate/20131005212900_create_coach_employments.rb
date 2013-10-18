class CreateCoachEmployments < ActiveRecord::Migration
  def change
    create_table :coach_employments do |t|
      t.integer :coach_id
      t.integer :team_id
      t.integer :year
      t.string :role
      t.integer :age

      t.timestamps
    end
  end
end

class CreateSourceDataPfrs < ActiveRecord::Migration
  def change
    create_table :source_data_pfrs do |t|
      t.string :coach
      t.integer :year
      t.integer :age
      t.string :level
      t.string :employer
      t.string :role

      t.timestamps
    end
  end
end

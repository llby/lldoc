class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.integer :project_id
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end

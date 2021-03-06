class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.boolean :public, default: true
      t.integer :district_num
      t.string :name

      t.timestamps
    end
  end
end

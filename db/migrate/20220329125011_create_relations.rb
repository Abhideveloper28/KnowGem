class CreateRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :relations do |t|
      t.references :gem_file, null: false, foreign_key: true
      t.references :gem_info, null: false, foreign_key: true

      t.timestamps
    end
  end
end

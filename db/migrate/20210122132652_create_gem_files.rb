class CreateGemFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :gem_files do |t|
      t.string :file

      t.timestamps
    end
  end
end

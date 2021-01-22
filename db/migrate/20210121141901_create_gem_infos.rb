class CreateGemInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :gem_infos do |t|
      t.string :name
      t.text :description
      t.string :path

      t.timestamps
    end
  end
end

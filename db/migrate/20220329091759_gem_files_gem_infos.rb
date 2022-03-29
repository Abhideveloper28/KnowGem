class GemFilesGemInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :gem_files_gem_infos, id: false do |t|
      t.belongs_to :gem_file
      t.belongs_to :gem_info
    end
  end
end

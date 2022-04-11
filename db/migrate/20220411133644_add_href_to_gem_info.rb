class AddHrefToGemInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :gem_infos, :href, :string
  end
end

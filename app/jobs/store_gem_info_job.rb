class StoreGemInfoJob < ApplicationJob
  queue_as :default

  def perform(gem_name, description)
    @gem_name    = gem_name
    @description = description

    save_gem_detail
  end

  def save_gem_detail
    GemInfo.create!(name: @gem_name, description: @description)
  end
end

class GemFile < ApplicationRecord
  has_many :relations
  has_many :gem_infos, through: :relations

  after_create :get_gems_and_store

  has_one_attached :file

  def get_gems_and_store
    GetGemsAndStoreJob.perform_later(id)
  end
end

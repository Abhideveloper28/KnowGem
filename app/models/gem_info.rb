class GemInfo < ApplicationRecord
  has_many :relations
  has_many :gem_files, through: :relations
end

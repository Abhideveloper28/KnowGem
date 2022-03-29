class Relation < ApplicationRecord
  belongs_to :gem_file
  belongs_to :gem_info
end

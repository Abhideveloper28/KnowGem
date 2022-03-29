class GemFile < ApplicationRecord
	has_and_belongs_to_many :gem_info
end

class GemInfo < ApplicationRecord
	has_and_belongs_to_many :gem_file
end

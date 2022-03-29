class GetGemsAndStoreJob < ApplicationJob
  queue_as :default

  def perform(gem_file_id)
    gem_file  = GemFile.find(gem_file_id)
    file_path = ActiveStorage::Blob.service.path_for(gem_file.file.key)

    File.open(file_path).each do |line|
      gem_row = line.chomp.split(' ')

      next unless gem_row.first == 'gem'

      gem_name = get_gem_name(gem_row)
      gem_info_id = GetGemInfoService.new(gem_name, gem_file.id).call
    end
  end

  def get_gem_name(gem_row)
    gem_full_name = gem_row.second
    split_by      = gem_full_name.include?("\"") ? "\"" : "'"

    gem_full_name.split(split_by)[1] # get gem_name to gemfile row
  end
end

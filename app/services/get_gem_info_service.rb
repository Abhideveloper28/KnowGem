require 'nokogiri'
require 'open-uri'

class GetGemInfoService
  GEM_URL = "https://rubygems.org/gems"

  def initialize(gem_name, gem_file_id)
    @gem_name = gem_name
    @gem_file_id = gem_file_id
  end

  def call
    gem_info = GemInfo.find_by(name: @gem_name)

    gem_info = GemInfo.create!(name: @gem_name, description: gem_scraping) if gem_info.nil?

    gem_info.update(description: gem_scraping) if gem_info.description.nil?
    # store record in middle table
    gem_info.relations.create(gem_file_id: @gem_file_id)
  end

  private

  def gem_scraping
    doc = Nokogiri::HTML(URI.open("#{GEM_URL}/#{@gem_name}"))

    gem_desc = doc.css('div.gem__desc p').text
  end
end

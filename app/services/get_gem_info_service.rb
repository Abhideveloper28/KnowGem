require 'nokogiri'
require 'open-uri'

class GetGemInfoService
  GEM_URL = "https://rubygems.org/gems"

  def initialize(gem_name)
    @gem_name = gem_name
  end

  def gem_description
    gem_info = GemInfo.find_by(name: @gem_name)
    if gem_info.present? && gem_info.description.present?
      puts 'Getting info from database'
      gem_info.description
    else
      puts 'Getting info from scraping'
      description = gem_scraping
      StoreGemInfoJob.new(@gem_name, description).perform_now
      description
    end
  end

  private

  def gem_scraping
    doc = Nokogiri::HTML(URI.open("#{GEM_URL}/#{@gem_name}"))

    gem_desc = doc.css('div.gem__desc p').text
  end
end

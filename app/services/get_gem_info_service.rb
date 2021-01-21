require 'nokogiri'
require 'open-uri'

class GetGemInfoService
  GEM_URL = "https://rubygems.org/gems"

  def gem_scraping(gem_name)
    doc = Nokogiri::HTML(URI.open("#{GEM_URL}/#{gem_name}"))

    gem_desc = doc.css('div.gem__desc p').text
  end
end

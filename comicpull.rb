require 'rubygems'
require 'nokogiri'     
require 'open-uri'

PAGE_URL = "http://www.diamondcomics.com/"

page = Nokogiri::HTML(open(PAGE_URL))
puts page.class   # => Nokogiri::HTML::Document

links = page.css('a')

# for i in links
	
# 	if i.text.include? "New Releases"
# 		puts i["href"]
# 		new_releases_url = i["href"]
# 	end
# end

# page = Nokogiri::HTML(open(new_releases_url))
# puts page.class

# links = page.css('a')

# links.each{ |x| puts x.text }

def comic_info(url)
	page = Nokogiri::HTML(open(url))

	top = page.css('div.StockCodeImage')
	puts top


end

comic_info("http://www.previewsworld.com/Home/1/1/71/917?stockItemID=OCT140734")
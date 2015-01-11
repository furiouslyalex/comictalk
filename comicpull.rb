require 'rubygems'
require 'nokogiri'
require 'nokogiri-styles'
require 'open-uri'

PAGE_URL = "http://www.diamondcomics.com/"

page = Nokogiri::HTML(open(PAGE_URL))

body = page.css('div.HtmlContent')
body1 = body.css('a')

for i in body1
	
	if i.text.include? "New Releases"
		new_releases_url = i["href"]
	end
end

page = Nokogiri::HTML(open(new_releases_url))

links = page.css('div.HtmlContent table tr')

#puts links.css('span')

for x in links
	spans = x.css('td span')
		for z in spans
			puts z.css('strong').text
			test = x.css('td a')
				for y in test
					puts y['href']
				end
		end
end


def comic_info(url)
	page = Nokogiri::HTML(open(url))

	tit1 = page.css('div.StockCodeDescription')
	puts  tit1[0].text

	img1 = page.css('div.StockCodeImage')
	img2 = img1.css("img")
	puts img2[0]["src"]

	pub1 = page.css('div.StockCodePublisher')
	puts pub1[0].text[11..pub1[0].text.length]

	cre1 = page.css('div.StockCodeCreators')
	puts cre1[0].text
	puts cre1[0].text.partition('(W)')

end

#comic_info("http://www.previewsworld.com/Home/1/1/71/917?stockItemID=OCT140734")
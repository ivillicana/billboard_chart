class BillboardHot100::Scraper
# Scrape songs from https://www.billboard.com/charts/hot-100
def self.scrape_songs
    page_html = Nokogiri::HTML(open("https://www.billboard.com/charts/hot-100"))
    chart = page_html.css(".chart-data .container")
    
    #Iterate through the first 100 rows of the billboard chart
    #Create instances of the Song class during each iteration
    rows = chart.css(".chart-row")
    rows.each do |row|
        song = BillboardHot100::Song.new
        song.title = row.css(".chart-row__song").text
        song.artist = row.css(".chart-row__artist").text.strip
        song.current_rank = row.css(".chart-row__current-week").text
        song.last_week_rank = row.css(".chart-row__secondary .chart-row__last-week .chart-row__value").text
        song.peak_position = row.css(".chart-row__secondary .chart-row__top-spot .chart-row__value").text
        song.weeks = row.css(".chart-row__secondary .chart-row__weeks-on-chart .chart-row__value").text
        song
    end  
end

end

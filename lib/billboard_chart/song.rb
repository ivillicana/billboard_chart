class BillboardChart::Song
    # set up attributes for each instance
    attr_accessor :title, :artist, :current_rank, :last_week_rank, :peak_position, :weeks

    @@all = []

    # initialize song object and add to @@all array
    def initialize
        @@all << self
    end

    # Return this week's Billboard Hot 100 based on scraped data
    def self.this_week
        self.scrape_songs
    end

    # Scrape songs from https://www.billboard.com/charts/hot-100
    def self.scrape_songs
        # title: row.css(".chart-row__song").text
        # artist: row.css(".chart-row__artist").text.strip
        # current_rank: row.css(".chart-row__current-week").text
        # last_week_rank: row.css(".chart-row__secondary .chart-row__last-week .chart-row__value").text
        # peak_position: row.css(".chart-row__secondary .chart-row__top-spot .chart-row__value").text
        # weeks: row.css(".chart-row__secondary .chart-row__weeks-on-chart .chart-row__value").text
        
        page_html = Nokogiri::HTML(open("https://www.billboard.com/charts/hot-100"))
        chart = page_html.css(".chart-data .container")
        
        #Iterate through the first 10 rows of the billboard chart
        #Create instances of the Song class during each iteration
        i = 1
        10.times do 
            row = chart.css(".chart-row--#{i}")
            song = BillboardChart::Song.new
            song.title = row.css(".chart-row__song").text
            song.artist = row.css(".chart-row__artist").text.strip
            song.current_rank = row.css(".chart-row__current-week").text
            song.last_week_rank = row.css(".chart-row__secondary .chart-row__last-week .chart-row__value").text
            song.peak_position = row.css(".chart-row__secondary .chart-row__top-spot .chart-row__value").text
            song.weeks = row.css(".chart-row__secondary .chart-row__weeks-on-chart .chart-row__value").text
            i += 1
        end
        @@all
        
    end
end
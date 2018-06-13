class BillboardChart::Song
    # set up attributes for each instance
    attr_accessor :title, :artist, :current_rank, :last_week_rank

    @@all = []

    # initialize song object and add to @@all array
    def initialize
        @@all << self
    end

    # Return this week's Billboard Hot 100 based on scraped data
    def self.this_week
        
    end

    # Scrape songs from https://www.billboard.com/charts/hot-100
    def self.scrape_songs
        # title: rows.css(".chart-row__song").text
        # artist: rows.css(".chart-row__artist").text
        # current_rank: rows.css(".chart-row__current-week").text
        # last_week_rank: rows.css(".chart-row__last-week").text
        # peak_position:
        # weeks:
        
        page_html = Nokogiri::HTML(open("https://www.billboard.com/charts/hot-100"))
        chart = page_html.css(".chart-data .container")
        rows = chart.css(".chart-row")
        
        rows.each do |row|
            song = BillboardChart::Song.new
            song.name = row.css(".chart-row__song").text
        end

        binding.pry
        # Create instances of BillboardChart::Song class
    end
end
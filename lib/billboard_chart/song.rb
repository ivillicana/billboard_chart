class BillboardChart::Song
    # set up attributes for each instance
    attr_accessor :title, :artist, :current_rank, :last_week_rank, :peak_position, :weeks

    # Return this week's Billboard Hot 100 based on scraped data
    def self.this_week(range)
        @@all ||= self.scrape_songs
        if range == 1
            @@all[0, 10]
        else
            @@all["#{range-1}0".to_i, 10]
        end
    end

    # Scrape songs from https://www.billboard.com/charts/hot-100
    def self.scrape_songs
        page_html = Nokogiri::HTML(open("https://www.billboard.com/charts/hot-100"))
        chart = page_html.css(".chart-data .container")
        
        #Iterate through the first 100 rows of the billboard chart
        #Create instances of the Song class during each iteration
        rows = chart.css(".chart-row")
        songs = []
        rows.collect do |row|
            song = BillboardChart::Song.new
            song.title = row.css(".chart-row__song").text
            song.artist = row.css(".chart-row__artist").text.strip
            song.current_rank = row.css(".chart-row__current-week").text
            song.last_week_rank = row.css(".chart-row__secondary .chart-row__last-week .chart-row__value").text
            song.peak_position = row.css(".chart-row__secondary .chart-row__top-spot .chart-row__value").text
            song.weeks = row.css(".chart-row__secondary .chart-row__weeks-on-chart .chart-row__value").text
            song
        end  
    end

    # Print info for chosen song
    def print_info
        puts ""
        puts "Title:          #{self.title}"
        puts "Artist:         #{self.artist}"
        puts "Current Rank:   #{self.current_rank}"
        puts "Previous Rank:  #{self.last_week_rank}"
        puts "Peak Rank:      #{self.peak_position}"
        puts "Total Weeks:    #{self.weeks}"
        puts ""
    end
end
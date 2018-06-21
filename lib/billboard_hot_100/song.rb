class BillboardHot100::Song
    # Build a Scraper class that scrapes data and sends it to Song to create new song instances

    # set up attributes for each instance
    attr_accessor :title, :artist, :current_rank, :last_week_rank, :peak_position, :weeks
    @@all = []

    # Return this week's Billboard Hot 100 based on scraped data
    def initialize
        @@all << self
    end

    # build a class getter method for @@all
    def self.all
        @@all
    end

    def self.this_week(range)
        @@all["#{range-1}0".to_i, 10] #selects only 10 songs within selected range
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
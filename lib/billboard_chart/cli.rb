class BillboardChart::CLI

    # Main instance method
    def run
        list_songs
    end
    
    # list songs from scraper
    def list_songs
        puts "Here are this week's Billboard Hot 10 songs:"
        top_songs
    end

    def top_songs
        #prints out the top 10 songs in chart for the week
        @songs = BillboardChart::Song.this_week
        @songs.each.with_index(1) do |song, i|
            puts "#{i}. #{song.title} - #{song.artist}"
        end
    end

    # displays main menu
    def menu
        
    end
end
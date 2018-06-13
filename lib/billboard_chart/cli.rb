class BillboardChart::CLI

    # Main instance method
    def run
        list_songs
        main_menu
    end
    
    # list songs from scraper
    def list_songs
        puts "Here are this week's Billboard Hot 10 songs:"
        puts ""
        top_songs
    end

    def top_songs
        #prints out the top 10 songs in chart for the week
        @songs = BillboardChart::Song.this_week
        @songs.each.with_index(1) do |song, i|
            puts "#{i}. #{song.title} - #{song.artist}"
        end
        puts ""
    end

    # displays main menu
    def main_menu
        puts "Enter number of song to see more information:"
        input = gets.strip.downcase

        if input.to_i > 0
            song = @songs[input.to_i - 1]
            song.print_info
        end
    end
end
class BillboardChart::CLI

    # Main instance method
    def run
        create_songs
        list_songs
        main_menu
        close_app
    end
    
    # list songs from scraper
    def list_songs
        puts "Here are this week's Billboard Hot 10 songs:"
        top_songs
    end

    def top_songs
        #prints out the top 10 songs in chart for the week
        
        puts ""
        @songs.each.with_index(1) do |song, i|
            puts "#{i}. #{song.title} - #{song.artist}"
        end
        puts ""
    end

    #create Song objects
    def create_songs
        @songs = BillboardChart::Song.this_week
    end

    # displays main menu
    def main_menu
        input = nil
        while input != "exit"   
            puts "Please enter the song number to see more information:"
            puts "(Type 'exit' to leave or 'list' to see chart)"
            input = gets.strip.downcase

            #if/elseif/else depending on user input
            if input.to_i.between?(1, @songs.length)
                song = @songs[input.to_i - 1]
                song.print_info
            elsif input == "list"
                list_songs
            else
                puts "Please enter a valid value..."
            end
        end
    end

    # ends the application
    def close_app 
        puts "Thank you for using the Billboard Hot 100 CLI Application!"
    end
end
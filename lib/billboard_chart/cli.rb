class BillboardChart::CLI

    # Main instance method
    def run
        create_songs
        list_songs
        main_menu
        close_app
    end
    
    # list songs from scraper
    def main_menu
        puts "Welcome to the Billboard Hot 100 app:"
        puts "Enter the number of range you would like to see?"
        select_range
        top_songs
    end

    #display and select range of songs
    def display_range
        i = 1
        10.times do
            puts "#{i}. Top 10 songs"
            i += 1
        end
    end
    
    def select_range
        input = gets.strip.downcase


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
    def select_song
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
                main_menu
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
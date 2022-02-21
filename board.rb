require_relative 'game.rb'

class Board < TicTacToe
    attr_accessor :position
    attr_reader :winning_positions
    
    def initialize
        @position = Array.new(9) {|i| i+1}
        # ============================
        # ALTERAR PARA SER CONSTANTE
        # ============================
        @winning_positions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]    
    end

    def update_board(position,identifier)
        if @position[position-1] == position
            @position[position-1]=identifier
            return true
        else 
            puts "Posição já selecionada!"
            return false
        end
    end

    def print_board()
        puts " #{@position[0]} | #{@position[1]} | #{@position[2]}"
        puts " --+---+---"
        puts " #{@position[3]} | #{@position[4]} | #{@position[5]}"
        puts " --+---+---"
        puts " #{@position[6]} | #{@position[7]} | #{@position[8]}"
    end

end





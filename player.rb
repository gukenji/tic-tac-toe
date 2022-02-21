class Player
    attr_accessor :nick, :score, :identifier, :movement_counter,:movements
    def initialize()
        @nick = gets.chomp
        @identifier = nil
        @movement_counter = 0
        @movements = []
    end

end
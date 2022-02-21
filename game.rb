require 'pry-byebug'

class TicTacToe
    # attr_accessor :actual_player
    def initialize()
        puts "Qual o nick do primeiro jogador?"
        @user1 = Player.new()
        puts "Selecione seu identificador: X ou O"
        @user1.identifier= gets.chomp.upcase
        until (@user1.identifier == "X" || @user1.identifier == "O")
            puts "Por favor, selecione apenas X ou O"
            @user1.identifier= gets.chomp.upcase
        end

        puts "Qual o nick do segundo jogador?"
        @user2 = Player.new()
        if @user1.identifier == "X"
            @user2.identifier = "O"
        else
            @user2.identifier = "X"
        end

        @board = Board.new()
        pick_a_square
    end

    def pick_a_square()
        @board.print_board
        @actual_player = choose_player
        puts "Selecione um lugar para marcar #{@actual_player.nick}:"
        @@position = gets.chomp.to_i
        until @board.update_board(@@position,@actual_player.identifier)
        # ============================        
        # ISSO TA STACKANDO DEMAIS! COMO RETIRAR DO STACK? (UM DOS DOIS OU OS DOIS)
        # ============================
            pick_a_square
            break if @board.update_board(@@position,@actual_player.identifier)
        end
        @actual_player.movement_counter+=1
        @actual_player.movements.push(@@position-1)
        # ============================        
        # ISSO TA STACKANDO DEMAIS! COMO RETIRAR DO STACK? (UM DOS DOIS OU OS DOIS)
        # ============================
        still_playable
    end

    def choose_player()
        if @user1.movement_counter <= @user2.movement_counter
            @actual_player = @user1
            return @user1
        else
            @actual_player = @user2
            return @user2
        end
    end

    def still_playable()
        if @board.winning_positions.any? {|array| (array-@actual_player.movements).empty?}
            puts "Fim de jogo!"
            puts "Quer jogar novamente?"
            new_game
        elsif @board.position.all? {|position| position == "X" || position == "O"}
            puts "Fim de jogo! Empate."
            puts "Quer jogar novamente?"
            new_game
        else
            pick_a_square
        end
    end

    def new_game()
        @@option = gets.chomp.downcase
        if @@option == 's'
            TicTacToe.new()
        elsif @@option == 'n'
            abort
        else 
            puts "Não entendi sua opção. Por favor, escolha S ou N"
            new_game
        end
    end
end



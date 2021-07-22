require 'bundler'
Bundler.require

require_relative 'plateau.rb'
########################################
########################################
####### CLASSE
class Player

    attr_accessor :name, :symbol, :victories
    @@array_players = []

    ########################################
    def initialize()
      @victories = 0
      @name = get_player_name
      @symbol = get_player_symbol
      @@array_players.push(self)
    end

    ########################################
    ####### GET_PLAYER_NAME
    def get_player_name
      puts ""
      puts "Bonjour, veuillez choisir votre Nom de Joueur :"
      puts ""
      print "> "
      nom = gets.chomp.to_s
      puts ""
      return nom
    end


    ########################################
    ####### GET_PLAYER_SYMBOL
    def get_player_symbol
      if @@array_players.empty?
        return 0
      else
        return 1
      end
    end


    ### ### ###

    ########################################
    ####### UPDATE VICTORY
    def up_victories
      return @victories += 1
    end



########################################    
end



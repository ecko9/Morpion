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
      puts "                                      BONJOUR"
      puts "                               VEUILLEZ SAISIR UN NOM"
      puts ""
      print "                                     > "
      nom = gets.chomp.to_s
      puts ""
      return nom
    end


    ########################################
    ####### GET_PLAYER_SYMBOL
    def get_player_symbol
      puts ""
      if @@array_players.empty?
        puts "                              VOTRE SYMBOLE EST LE ROND"
        puts "                                   >>>    0    <<<"
        puts ""
        return 0
      else
        puts "                              VOTRE SYMBOLE EST LA CROIX"
        puts "                                   >>>    X    <<<"
        puts ""
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



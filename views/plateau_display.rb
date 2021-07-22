require 'bundler'
Bundler.require

require_relative '../lib/game.rb'
require_relative '../lib/joueurs.rb'
require_relative '../lib/plateau.rb'
########################################
########################################
####### CLASSE
class PlateauDisplay

  #attr_accessor :var, :var2

  ########################################
  def initialize(plateau)
    plateau_top(plateau)
    plateau_lines(plateau)
    
  end


  ########################################
  ####### PLATEAU TOP (AFFICHAGE COLONNES)
  def symbolizer(array)
    array_sym = []
    array.each do |i|
      if i == 0 
        array_sym.push("0")
      elsif i == 1
        array_sym.push("X")
      else
        array_sym.push(" ")
      end
    end
    return array_sym
  end
  ########################################
  ####### PLATEAU TOP (AFFICHAGE COLONNES)
  def plateau_top(plateau)
    
    puts "           |                    |                    |                    |"
    puts "           |         1          |         2          |         3          |"
    puts "   ________|____________________|____________________|____________________|"
    
  end

  ########################################
  ####### PLATEAU LINES (AFFICHAGE COLONNES)
  def plateau_lines(plateau)
    char = 65
    plateau.each do |line|
      puts "           |                    |                    |                    |"
      puts "           |                    |                    |                    |"
      puts "     #{char.chr}     |         #{symbolizer(line)[0]}          |         #{symbolizer(line)[1]}          |         #{symbolizer(line)[2]}          |"
      puts "           |                    |                    |                    |"
      puts "   ________|____________________|____________________|____________________|"
      char += 1
    end
  end

#############################################################
end

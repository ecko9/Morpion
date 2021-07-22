require 'bundler'
Bundler.require


require_relative 'joueurs.rb'
require_relative 'plateau.rb'
require_relative '../views/plateau_display.rb'


########################################
########################################
####### CLASSE
class Game

  #attr_accessor :var, :var2

  ########################################
  def initialize()
    perform
  end


  ########################################
  ####### TOUR JOUEUR
  def tour_joueur(player, plateau)
    puts ""
    puts "Choisi une case où placer ton symbole (ex: A2)"
    print "> "
    input_raw = gets.chomp.to_s
    ascii_letter1 = input_raw[0].ord.to_i
    ascii_letter2 = input_raw[1].to_i
    if (ascii_letter1 > 64 && ascii_letter1 < 68) && (ascii_letter2 > 0 && ascii_letter2 < 4)
      y = ascii_letter1 - 65
      x = ascii_letter2 - 1
      if  plateau[y][x] == 0 ||  plateau[y][x] == 1
        puts "ERREUR : Vérifiez vos coordonnées !"
        puts "> Un Symbole existe déja à cet emplacement..."
        tour_joueur(player, plateau)
      else
        plateau[y][x] = player.symbol
      end
    else
      puts "ERREUR : Vérifiez vos coordonnées !"
      puts "> Une lettre Majuscule entre A et C pour les lignes..."
      puts "> Un chiffre compris entre 1 et 3 pour les collones..."
      tour_joueur(player, plateau)
    end
  end
  

  
  ########################################
  ####### LINE CHECKER
  def line_checker(plateau)
    plateau.each do |line|
      sum = 0
      line.each { |col| sum += col }
      if sum == 0
        return true
      elsif sum == 3
        return true
      else
      end
    end
    return false
  end

  ########################################
  ####### COL CHECKER
  def col_checker(plateau)
    3.times do |i|
      sum = 0
      plateau.each do |line|
        sum += line[i]
      end

      if sum == 0
        return true
      elsif sum == 3
        return true
      else
      end
    end

    return false
  end

  ########################################
  ####### DIAG CHECKER
  def diag_checker(plateau)
    sum1 = plateau[0][0] + plateau[1][1] + plateau[2][2]
    sum2 = plateau[0][2] + plateau[1][1] + plateau[2][0]
   if sum1 == 0 || sum2 == 0
    return true
   elsif sum1 == 3 || sum2 == 3
    return true
   else
    return false
   end
  end


  ########################################
  ####### CHECK WIN
  def is_a_winner?(plateau)
    if line_checker(plateau)
      return true
    elsif col_checker(plateau)
      return true
    elsif diag_checker(plateau)
      return true
    else
      return false
    end
  end

  ########################################
  ####### TOURS DE JEU
  def turns(plateau, p1, p2)
    PlateauDisplay.new(plateau)
    while is_a_winner?(plateau) != true

      puts ""
      puts "A ton tour #{p1.name} :"
      tour_joueur(p1, plateau)
      PlateauDisplay.new(plateau)
      if is_a_winner?(plateau)
        puts "Felicitation #{p1.name}"
        p1.victories += 1
        break
      end

      puts ""
      puts "A ton tour #{p2.name} :"
      tour_joueur(p2, plateau)
      PlateauDisplay.new(plateau)
      if is_a_winner?(plateau)
        puts "Felicitation #{p2.name}"
        p2.victories += 1
        break
      end

    end
    puts "Partie terminée"
  end


  ########################################
  ####### START SCREEN
  def start_screen
    puts ""
    puts "                                        -------------------------                   "
    puts "                                        -------------------------                   "
    puts "                                                   \\ /                             "
    puts "                                                 MORPION                            "
    puts "                                                   / \\                             "
    puts "                                        -------------------------                   "
    puts "                                        -------------------------                   "
  end

  ########################################
  ########################################
  ####### PERFORM
  def perform
    start_screen
    p1 = Player.new()
    p2 = Player.new()
    plateau = Plateau.new().array
    turns(plateau, p1, p2)
  end

######################################  
end



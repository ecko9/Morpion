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
  def initialize(joueur1, joueur2)
    perform(joueur1, joueur2)
  end


  ########################################
  ####### TOUR JOUEUR
  def tour_joueur(player, plateau)
    puts ""
    puts "                                CHOISI UNE CASE (EX: A2)"
    print "> "
    input_raw = gets.chomp.to_s
    ascii_letter1 = input_raw[0].ord.to_i
    ascii_letter2 = input_raw[1].to_i
    if (ascii_letter1 > 64 && ascii_letter1 < 68) && (ascii_letter2 > 0 && ascii_letter2 < 4)
      y = ascii_letter1 - 65
      x = ascii_letter2 - 1
      if  plateau[y][x] == 0 ||  plateau[y][x] == 1
        puts "                            ERREUR : MAUVAISES COORDONNEES !"
        puts "                    > Un Symbole existe déja à cet emplacement..."
        tour_joueur(player, plateau)
      else
        plateau[y][x] = player.symbol
      end
    else
      puts "                              ERREUR : MAUVAISES COORDONNEES !"
      puts "                     > Une lettre Majuscule entre A et C pour les lignes..."
      puts "                     > Un chiffre compris entre 1 et 3 pour les collones..."
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
  ####### CHECK EQUALITY
  def is_equality?(plateau)
    count = 0
    plateau.each do |line|
      line.each do |col|
        if col == 9
          count += 1
        end
      end
    end
    if count == 0
      return true
    else 
      return false
    end
  end

  ########################################
  ####### TOURS DE JEU
  def turns(plateau, p1, p2)
    puts ""
    puts ""
    PlateauDisplay.new(plateau)
    puts ""
    puts ""
    while is_a_winner?(plateau) != true

      puts ""
      puts "                                  >>>#{" " * (6 - (p1.name.length / 2))}#{p1.name}#{" " * (6 - (p1.name.length / 2))}<<<"
      puts "                                   >>      0      <<"
      tour_joueur(p1, plateau)
      PlateauDisplay.new(plateau)
      puts ""
      puts ""
      if is_a_winner?(plateau)
        puts "                  FELICITATION #{p1.name}, VOUS REMPORTEZ LA PARTIE !"
        p1.victories += 1
        break
      end

      if is_equality?(plateau)
        puts "                                      EGALITE"
        break
      end

      puts ""
      puts "                                  >>>#{" " * (6 - (p2.name.length / 2))}#{p2.name}#{" " * (6 - (p2.name.length / 2))}<<<"
      puts "                                   >>      X      <<"
      tour_joueur(p2, plateau)
      puts ""
      puts ""
      PlateauDisplay.new(plateau)
      puts ""
      puts ""
      if is_a_winner?(plateau)
        puts "                  FELICITATION #{p2.name}, VOUS REMPORTEZ LA PARTIE !"
        p2.victories += 1
        break
      end

    end
    end_screen(p1, p2)
  end


  ########################################
  ####### REJOUER ?
  def replay(p1, p2)
    puts ""
    puts "                                 REJOUER UNE PARTIE ?"
    puts "                                       (Y / N)"
    print "> "
    input = gets.chomp.to_s
    if input == "Y"
      perform(p1, p2)
    elsif input == "N"
      puts "                                A BIENTOT SUR MORPION !"
    else
      puts "                    ERREUR DE SAISIE : 'Y' pour OUI / 'N' pour NON"
      replay(p1, p2)
    end
  end

  ########################################
  ####### END SCREEN
  def end_screen(p1, p2)
    puts ""
    puts "                              -------------------------                  "
    puts "                              -------------------------                  "
    puts "                                         \\ /                             "
    puts "                                      GAME OVER                          "
    puts "                                         / \\                             "
    puts "                              -------------------------                  "
    puts "                              -------------------------                  "
    puts ""
    puts "                                      VICTOIRES"
    puts ""
    puts "                               #{p1.name}#{" " * (20 - p1.name.length)}#{p2.name}"
    puts "                       _________________________________________ "
    puts "                      |                    |                    |"
    puts "                      |         #{p1.victories}#{" " * (11 - p1.victories.to_s.length)}|         #{p2.victories}#{" " * (11 - p2.victories.to_s.length)}|"
    puts "                      |____________________|____________________|"
    puts ""
    puts ""
    replay(p1, p2)
  end

  ########################################
  ####### START SCREEN
  def start_screen
    puts ""
    puts ""
    puts ""
    puts "                              -------------------------                   "
    puts "                              -------------------------                   "
    puts "                                         \\ /                             "
    puts "                                       MORPION                            "
    puts "                                         / \\                             "
    puts "                              -------------------------                   "
    puts "                              -------------------------                   "
    puts ""
    puts ""
    puts "                          APPUYER SUR UNE TOUCHE POUR COMMENCER"
    gets.chomp.to_s
  end

  ########################################
  ########################################
  ####### PERFORM
  def perform(p1, p2)
    start_screen
    plateau = Plateau.new().array
    turns(plateau, p1, p2)
  end

######################################  
end



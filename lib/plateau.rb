require 'bundler'
Bundler.require


########################################
########################################
####### CLASSE
class Plateau

  attr_accessor :lignes, :columns, :array

  ########################################
  def initialize()
    @lignes = 3
    @columns = 3
    @array = create_array_empty
    
  end

  ########################################
  ####### CREATE_EMPTY_ARRAY
  def create_array_empty
    array = []
    lignes.times do |ligne|
      line_of_a = []
      columns.times do |column|
        line_of_a.push(9)
      end
      array.push(line_of_a)
    end
    return array
  end

  ### ### ### 

  ########################################
  ####### MODIFY THE ARRAY
  def played(ligne, colonne, symb)
    @array[ligne][colonne] = symb
  end

####################################
end



require 'bundler'
Bundler.require


require_relative 'lib/game.rb'
require_relative 'lib/joueurs.rb'
require_relative 'lib/plateau.rb'
require_relative 'views/plateau_display.rb'

########################################

obj = Game.new()


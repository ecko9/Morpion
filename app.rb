require 'bundler'
Bundler.require


require_relative 'lib/game.rb'
require_relative 'lib/joueurs.rb'
require_relative 'lib/plateau.rb'
require_relative 'views/plateau_display.rb'

########################################

p1 = Player.new()
p2 = Player.new()
obj = Game.new(p1, p2)


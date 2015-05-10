#! /usr/bin/env ruby

require "gosu"

require_relative "drawer"
require_relative "credits"
require_relative "field"
require_relative "game"
require_relative "menu"
require_relative "penguin"
require_relative "toast"

class GameWindow < Gosu::Window
	def initialize
		# This creates the window and such.
		#      w,   h,  fullscreen
		super 800, 400, false
		self.caption = "Toasty Penguin Pool"

		# Valid locations are :menu, :game, and :credits.
		@location = :menu
		font = Gosu::Font.new(self, Gosu::default_font_name, 20)
		@menu = Menu.new(self, font)
		@credits = Credits.new(self, font)
	end

	# Allows a button to be held down and still activated.
	def button_down(id)
	end

	# Only allows the button to be pressed once for this to run.
	def button_up(id)
		case id
		when Gosu::KbEscape
			if @location == :menu
				close
			else
				@location = :menu
			end
		when Gosu::KbReturn
			@location = :game
		end
	end

	def update
	end

	def draw
		if @location == :menu
			@menu.draw
		elsif @location == :game
			@game.draw
		elsif @location == :credits
			@credits.draw
		end
	end

	# Give us a mouse pointer; we'll want to use it for gameplay.
	def needs_cursor?
		true
	end
end

# This code actually makes the window open.
window = GameWindow.new
window.show

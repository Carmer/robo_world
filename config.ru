require 'bundler'
Bundler.require

$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)+ "/app"))

require "controllers/robo_world_app"

run RoboWorldApp

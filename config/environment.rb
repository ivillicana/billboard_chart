require 'bundler/setup'
require 'pry'
require 'open-uri'

Bundler.require(:default)

require_relative "../lib/billboard_chart/version"
require_all './lib/billboard_chart'
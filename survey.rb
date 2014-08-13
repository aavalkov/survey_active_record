require 'active_record'
require './lib/survey'
require './lib/response'
require './lib/question'
require 'pry'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def main_menu
  puts "Press 's' to add a new survey"
  user_choice = gets.chomp
  case user_choice
    when 's' then add_survey
  end
end

def add_survey
  puts "Enter the title of your survey"
  title = gets.chomp
  new_title = Survey.create({:title => title})
end


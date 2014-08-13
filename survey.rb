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
  puts "Press 'l' to list surveys"
  puts "Press 's' to exit"
  user_choice = gets.chomp
  case user_choice
    when 's' then add_survey
    when 'l' then list_survey
    when 'x' then exit
  end
  main_menu
end

def add_survey
  puts "Enter the title of your survey"
  title = gets.chomp
  new_title = Survey.create({:title => title})
  puts "Survey #{new_title.title} added!"
end

def list_survey
  puts "All surveys:\n"
  Survey.all.each { |s| puts s.title}
  puts "\n"
end

main_menu


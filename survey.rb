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
  puts "Press 'u' to list all questions"
  puts "Press 'q' to add a question to a survey"
  puts "Press 'x' to exit"
  user_choice = gets.chomp
  case user_choice
    when 's' then add_survey
    when 'l' then list_survey
    when 'u' then list_question
    when 'q' then add_question
    when 'x' then exit
  end
  main_menu
end

def add_survey
  puts "Enter the title of your survey"
  print ">"
  title = gets.chomp
  new_title = Survey.create({:title => title})
  puts "Survey #{new_title.title} added!"
end

def list_survey
  puts "All surveys:\n"
  Survey.all.each { |s| puts s.title}
  puts "\n"
end

def list_question
  puts "All questions:\n"
  Question.all.each { |q| puts q.name }
  puts "\n"
end

def add_question
  list_survey
  puts "Select the survey to add a question to: "
  print ">"
  survey_title = gets.chomp
  survey = Survey.find_or_create_by(:title => survey_title)
  puts "Enter your question"
  print ">"
  name = gets.chomp
  new_question = Question.create({:name => name, :survey_id => survey.id })
  puts "The question '#{new_question.name}' has been added to '#{survey.title}'!\n"
end

main_menu


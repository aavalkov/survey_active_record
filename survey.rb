require 'active_record'
require './lib/survey'
require './lib/response'
require './lib/question'
require './lib/choice'
require 'pry'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def main_menu
  puts "\n** Welcome to Surveys!! **"
  puts "Press 'b' to build a survey."
  puts "Press 't' to take a survey."
  puts "Press 'x' to exit."
  print ">"
  user_choice = gets.chomp
  case user_choice
    when 'b' then survey_builder
    when 't' then survey_taker
    when 'x' then exit
  end
  main_menu
end

def survey_builder
  puts "Press 's' to add a new survey"
  puts "Press 'l' to list surveys"
  puts "Press 'u' to list all questions"
  puts "Press 'q' to add a question to a survey"
  puts "Press 'c' to add a choice to a question"
  puts "Press 'v' to view all choices for a question"
  puts "Press 'm' to return to the main menu"
  puts "Press 'x' to exit"
  print ">"
  user_choice = gets.chomp
  case user_choice
    when 'c' then add_choice
    when 's' then add_survey
    when 'l' then list_survey
    when 'u' then list_question
    when 'q' then add_question
    when 'v' then view_choices
    when 'm' then main_menu
    when 'x' then exit
  end
  survey_builder
end

def survey_taker
  puts "Press 'l' to choose a survey to take"
  puts "Press 'm' to return to the main menu"
  puts "Press 'x' to exit"
  print ">"
  user_choice = gets.chomp
  case user_choice
    when 'l' then choose_survey
    when 'm' then main_menu
    when 'x' then exit
  end
  survey_taker
end

def choose_survey
  list_survey
  puts "Enter the number of the survey you'd like to take"
  number = gets.chomp.to_i
  survey = Survey.find(number)
  puts "The #{survey.title} is ready!"
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
  Survey.all.each { |s| puts "#{s.id}. #{s.title}"}
  puts "\n"
end

def list_question
  puts "All questions:\n"
  Question.all.each { |q| puts "#{q.id}. #{q.name}" }
  puts "\n"
end

def add_question
  list_survey
  puts "Select the survey to add a question to: "
  print ">"
  survey_id = gets.chomp.to_i
  survey = Survey.find(survey_id)
  puts "Enter your question"
  print ">"
  name = gets.chomp
  new_question = Question.create({:name => name, :survey_id => survey.id })
  puts "The question '#{new_question.name}' has been added to '#{survey.title}'!\n"
end

def add_choice
  list_question
  puts "Select the question to add a choice to: "
  print ">"
  question_id = gets.chomp.to_i
  question = Question.find(question_id)
  puts "Enter the new choice:"
  print ">"
  name = gets.chomp
  new_choice = Choice.create({:name => name, :question_id => question.id})
  puts "The choice '#{new_choice.name}' has been added to '#{question.name}'!\n"
end

def view_choices
  list_question
  puts "Enter the number of the question that you'd like to view choices for"
  question_number = gets.chomp.to_i
  choices = Choice.where(:question_id => question_number)
  choices.each {|choice| puts choice.name}
end


main_menu


require 'spec_helper'

describe Question do
  it 'it belongs to a survey' do
    survey = Survey.create({:title => "assessment feedback"})
    survey2 = Survey.create({:title => "job satisfaction"})
    question = Question.create({:name => "Choose your age range", :survey_id => survey.id })
    question2 = Question.create({:name => "Choose your age range", :survey_id => survey2.id})
    expect(question.survey).to eq survey
  end

  it 'has many choices' do
    survey = Survey.create({:title => "assessment feedback"})
    question = Question.create({:name => "Choose your age range", :survey_id => survey.id })
    choice = Choice.create(:name => '20s', :question_id => question.id)
    choice2 = Choice.create(:name => 'None of your business', :question_id => question.id)
    expect(question.choices).to eq [choice, choice2]
  end
end

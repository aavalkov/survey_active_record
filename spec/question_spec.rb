require 'spec_helper'

describe Question do
  it 'it belongs to a survey' do
    survey = Survey.create({:title => "assessment feedback"})
    survey2 = Survey.create({:title => "job satisfaction"})
    question = Question.create({:name => "Choose your age range", :survey_id => survey.id })
    question2 = Question.create({:name => "Choose your age range", :survey_id => survey2.id})
    expect(question.survey).to eq survey
  end
end

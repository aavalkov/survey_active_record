require 'spec_helper'

describe Survey do
  it "has many questions" do
    survey = Survey.create({:title => "assessment feedback"})
    question = Question.create({:name => "Choose your age range", :survey_id => survey.id })
    question2 = Question.create({:name => "Choose your previous experiece level", :survey_id => survey.id})
    survey.questions << question
    survey.questions << question2
    expect(survey.questions).to eq [question, question2]
  end
end


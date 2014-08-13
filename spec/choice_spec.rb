require 'spec_helper'

describe Choice do
  it 'belongs to a question' do
    survey = Survey.create({:title => "assessment feedback"})
    question = Question.create({:name => "Choose your age range", :survey_id => survey.id })
    choice = Choice.create(:name => '20s', :question_id => question.id)
    choice2 = Choice.create(:name => 'None of your business', :question_id => question.id)
    expect(choice.question).to eq question
  end
end

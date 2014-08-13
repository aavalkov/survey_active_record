require 'spec_helper'

describe Choice do
  it 'belongs to a question' do
    survey = Survey.create({:title => "assessment feedback"})
    question = Question.create({:name => "Choose your age range", :survey_id => survey.id })
    choice = Choice.create(:name => '20s', :question_id => question.id)
    choice2 = Choice.create(:name => 'None of your business', :question_id => question.id)
    expect(choice.question).to eq question
  end

  it 'has many responses' do
    choice = Choice.create(:name => '20s')
    response = Response.create(:choice_id => choice.id)
    expect(choice.responses).to eq [response]
  end

  describe 'number_of_responses' do
    it 'counts the number of responses for this choice' do
      survey = Survey.create({:title => "assessment feedback"})
      question = Question.create({:name => "Choose your age range", :survey_id => survey.id })
      choice = Choice.create(:name => '20s', :question_id => question.id)
      choice2 = Choice.create(:name => 'None of your business', :question_id => question.id)
      response = Response.create(:choice_id => choice.id)
      response2 = Response.create(:choice_id => choice2.id)
      response3 = Response.create(:choice_id => choice2.id)
      response4 = Response.create(:choice_id => choice2.id)
      expect(choice2.number_of_responses).to eq 3
    end
  end
end

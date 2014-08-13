require 'spec_helper'

describe Response do
  it "belongs to a choice" do
    choice = Choice.create(:name => '20s')
    response = Response.create(:choice_id => choice.id)
    expect(response.choice).to eq choice
  end
end

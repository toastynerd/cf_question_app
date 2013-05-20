require 'spec_helper'

feature "listing all questions in index" do
  scenario "Listing all questions in the index" do
    question = Factory(:question, :ask => "How?")
    visit '/'
    click_link question.ask
    page.current_url.should == question_url(question)
  end
end

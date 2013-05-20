require 'spec_helper'

feature "edit questions" do
  before do
    question = Factory(:question, :ask => "How?")
    visit '/'
    click_link question.ask
    click_link "Edit Question"
  end

  scenario "updating a question" do 
    fill_in "Ask", :with => "How do you do?"
    click_button "Update Question"
    page.should have_content("Question has been updated.")
  end

  scenario "updating a quesiton with bad data should return an error" do
    fill_in "Ask", :with => ""
    click_button "Update Question"
    page.should have_content("Question has not been updated.")
  end
end

require 'spec_helper'

feature "deleting quesitons" do 
  before do
    question = Factory(:question, :ask => "How to do?")
    visit '/'
    click_link question.ask
  end

  scenario "Sould be able to delete a quesiton" do
    click_link "Delete Question"
    page.should have_content("Question has been deleted.")

    visit '/'
    page.should_not have_content("How to do?")
  end
end



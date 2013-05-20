require 'spec_helper'

feature "creating answers" do

  before do
    Factory(:question, :ask => "Some new question")
    visit '/'
    click_link "Some new question"
    click_link "Answer Question"
  end

  scenario "Creating an answer" do
    fill_in "Answer", :with => "Here's an answer."
    click_button "Create Answer"
    page.should have_content("Answer has been created.")
  end

  scenario "Creating a ticket without valid attributes fails." do
    fill_in "Answer", :with => ""
    click_button "Create Answer"
    page.should have_content("Answer has not been created.")
    page.should have_content("Answer can't be blank")
  end
end



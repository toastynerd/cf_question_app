require 'spec_helper'

feature "creating questions" do
  before do
    visit '/'
    click_link "Ask a New Question"
  end

  scenario "should be able to create a new question" do
    fill_in "Ask", :with => "Is this a good example question?"
    fill_in "Detail", :with => "I just really need to know."
    click_button "Ask Question"
    page.should have_content("Your question has been created.")
  end

  scenario "should not able to ask a blank question." do
    fill_in "Ask", :with => ""
    fill_in "Detail", :with => ""
    click_button "Ask Question"
    page.should have_content("Unable to create question.")
    page.should have_content("Ask can't be blank")
  end
end

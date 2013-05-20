require 'spec_helper'

feature "viewing tickets" do
  before do
    the_question = Factory(:question, :ask => "How goes it?")
    Factory(:answer, :question => the_question, :answer => "it goes.")
    the_second_question = Factory(:question, :ask => "What up?" )
    Factory(:answer, :question => the_second_question, :answer => "notta lotta")
    visit '/'
  end

  scenario "viewing the tickets for a given project" do
    click_link "How goes it?"
    page.should have_content("it goes.")
    page.should_not have_content("notta lotta")

    click_link("it goes.")
    page.should have_content("it goes.")
  end
end
require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end

  test "We can fill the form with a random word, click the play button, and get a message that the word is not in the grid" do
    visit new_url
    fill_in 'user-word', :with => 'djeognzb'
    click_on 'submit-btn'
    assert test: "can't be built out of"
  end

  test "We can fill the form with a one-letter consonant word, click play, and get a message it’s not a valid English word" do
    visit new_url
    fill_in 'user-word', :with => 'b'
    click_on 'submit-btn'
    assert test: "does not seem to be a valid english word"
  end
end

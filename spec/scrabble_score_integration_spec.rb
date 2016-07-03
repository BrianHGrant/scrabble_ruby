require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the scrabble score path', {:type => :feature}) do
  it('processes the user entry and returns a scrabble score') do
    visit('/')
    fill_in('word', :with => 'xylophone')
    click_button('Calculate')
    expect(page).to have_content(24)
  end
  it('processes the user entry and returns an error message for a non-english word') do
    visit('/')
    fill_in('word', :with => 'xylo')
    click_button('Calculate')
    expect(page).to have_content("is not in the English language")
  end
end

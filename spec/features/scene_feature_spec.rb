require 'rails_helper'

feature 'User clicks on a previously added location' do

  before(:each) do
    create_visit
    visit new_scene_path
    fill_in 'enterDBLocation', with: 'Louvre Pyramid, 75001, Paris, France'
    click_button 'Select Location'
  end

  scenario 'and sees a list of movies associated with it', js: true do
    expect(page).to have_content 'The Da Vinci Code (2006)'
  end

  xscenario 'has the option to add a new scene to that movie', js: true do
    click_link 'The Da Vinci Code'
    expect(page).to have_content 'Tell us something about your visit'
  end

end
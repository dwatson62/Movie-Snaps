require 'rails_helper'

def fill_autocomplete(field, options = {})
  fill_in field, with: options[:with]
  sleep 8
  page.execute_script %Q{ $('##{field}').trigger('keydown') }
  selector = %Q{ul.ui-autocomplete li.ui-menu-item a:contains("#{options[:select]}")}
  page.execute_script %Q{ $('#{selector}').trigger('mouseenter').click() }
end

feature 'A user wants to add a movie' do

  before(:each) do
    create_visit
    click_link 'Upload photos'
  end

  scenario 'but cannot enter a movie before a location', js: true do
    expect(page).not_to have_button 'Submit Visit'
  end

  xscenario 'and can enter the movie and have it autocompleted', js: true do
    fill_in 'enterDestination', with: 'Makers Academy, London'
    click_button 'Go!'
    click_button 'Place Marker'
    fill_autocomplete('enterMovie', with: 'Shrek')
    expect(page).to have_selector('ul.ui-autocomplete li.ui-menu-item')
  end

  context 'when entering a new location' do
    xscenario 'can enter a new movie and be saved', js: true do
      fill_in 'enterDestination', with: 'Makers Academy, London'
      click_button 'Go!'
      click_button 'Place Marker'
      fill_autocomplete('enterMovie', with: 'Shrek')
      expect { click_button 'Submit Visit' }.to change { Movie.count }.by 1
    end

    xscenario 'can enter a duplicate movie, and it will not be saved', js: true do
      fill_in 'enterDestination', with: 'Makers Academy, London'
      click_button 'Go!'
      click_button 'Place Marker'
      fill_in('enterMovie', with: 'The Da Vinci Code (2006)')
      expect { click_button 'Submit Visit' }.to change { Movie.count }.by 0
    end
  end

  context 'in an existing location' do
    xscenario 'can add a new movie', js: true do
      fill_in 'enterDBLocation', with: 'Louvre Pyramid, 75001, Paris, France'
      click_button 'Select Location'
      fill_autocomplete('enterMovie', with: 'Shrek')
      expect { click_button 'Add Movie' }.to change { Movie.count }.by 1
    end
  end

end

feature 'User views an individual movie page' do

  before do
    create_visit
    movie = Movie.last
    photo = Photo.last
    user = User.last
    Comment.create(remark: 'Nice photo!', photo_id: photo.id, user_id: user.id)
    visit "/movies/#{movie.id}"
  end

  xscenario "can click on movie and see the movie page", js: true do
    click_link 'Louvre Pyramid, 75001, Paris, France'
    click_link 'The Da Vinci Code (2006)'
    expect(page).to have_content("The Da Vinci Code (2006)")
  end

  xscenario "can see movie title" do
    expect(page).to have_content("The Da Vinci Code (2006)")
  end

  scenario "has link with address" do
    expect(page).to have_link("Louvre Pyramid, 75001, Paris, France")
  end

  scenario "has scene photo" do
    expect(page).to have_selector("img[src*='http://bit.ly/1JBfXCZ']")
  end

  scenario "has fan photo", js: true do
    expect(page).to have_css('ul.photos')
  end

  scenario "has a caption" do
    expect(page).to have_content("This was filmed here")
  end

  scenario "has a user" do
    expect(page).to have_content("John Doe")
  end

  scenario "displays correct number of scenes" do
    expect(page.all('ul.scenes li.scene').size).to eq(1)
  end

  scenario "displays correct number of visits" do
    expect(page.all('ul.visits li.visit').size).to eq(1)
  end

  scenario "displays correct number of photos" do
    expect(page.all('ul.photos li.photo').size).to eq(1)
  end

  scenario "displays correct number of comments" do
    expect(page.all('ul.comments li.comment').size).to eq(1)
  end

end

feature 'User views the movie index page' do

  before do
    create_visit
    visit '/movies'
  end

  scenario 'enters a movie in database and have it autocompleted', js: true do
    fill_autocomplete('enterMovie', with: 'Da Vinci')
    expect(page).to have_selector('ul.ui-autocomplete li.ui-menu-item')
  end

  scenario 'enters a movie not in database and not have it autocompleted', js: true do
    fill_autocomplete('enterMovie', with: 'Drive')
    expect(page).not_to have_selector('ul.ui-autocomplete li.ui-menu-item')
  end

  scenario 'enters a movie not in database and sees error message', js: true do
    fill_autocomplete('enterMovie', with: 'Drive')
    click_button 'Select Movie'
    expect(page).to have_content('Movie not yet in database')
  end

end
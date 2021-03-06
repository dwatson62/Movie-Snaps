require 'rails_helper'

feature 'A user on the homepage' do
  context 'while logged in' do
    before(:each) do
      create_visit
    end

    scenario 'can like a photo', js: true do
      visit '/'
      click_link '♡'
      expect(page).to have_content '1 like'
      expect(Like.count).to eq 1
    end
    scenario 'can only like a photo once', js: true do
      visit '/'
      click_link '♡'
      expect(page).not_to have_link '♡'
    end
  end

  context 'when logged out' do
    before(:each) do
      create_visit
      visit '/'
      click_link 'Sign out'
    end

    scenario 'cannot like a photo', js: true do
      expect(page).not_to have_link '♡'
    end
  end

end

feature 'A user on the users page' do
  context 'while logged in' do
    before(:each) do
      create_visit
      u = User.first
      visit "/users/#{u.id}"
    end

    scenario 'can like a photo', js: true do
      click_link '♡'
      expect(Like.count).to eq 1
    end
    scenario 'can only like a photo once', js: true do
      click_link '♡'
      expect(page).not_to have_link '♡'
    end
  end

  context 'when logged out' do
    before(:each) do
      create_visit
      visit '/'
      click_link 'Sign out'
      u = User.first
      visit "/users/#{u.id}"
    end

    scenario 'cannot like a photo', js: true do
      expect(page).not_to have_link '♡'
    end
  end

end

feature 'A user on the locations page' do
  context 'while logged in' do
    before(:each) do
      create_visit
      l = Location.first
      visit "/users/#{l.id}"
    end

    scenario 'can like a photo', js: true do
      click_link '♡'
      expect(Like.count).to eq 1
    end
    scenario 'can only like a photo once', js: true do
      click_link '♡'
      expect(page).not_to have_link '♡'
    end
  end

  context 'when logged out' do
    before(:each) do
      create_visit
      visit '/'
      click_link 'Sign out'
      l = Location.first
      visit "/users/#{l.id}"
    end

    scenario 'cannot like a photo', js: true do
      expect(page).not_to have_link '♡'
    end
  end

end

feature 'A user on the movies page' do
  context 'while logged in' do
    before(:each) do
      create_visit
      m = Movie.first
      visit "/movies/#{m.id}"
    end

    scenario 'can like a photo', js: true do
      click_link '♡'
      expect(page).to have_content '1 like'
      expect(Like.count).to eq 1
    end
    scenario 'can only like a photo once', js: true do
      click_link '♡'
      expect(page).not_to have_link '♡'
    end
  end

  context 'when logged out' do
    before(:each) do
      create_visit
      visit '/'
      click_link 'Sign out'
      l = Location.first
      visit "/users/#{l.id}"
    end

    scenario 'cannot like a photo', js: true do
      expect(page).not_to have_link '♡'
    end
  end

end
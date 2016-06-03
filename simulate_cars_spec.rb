require 'rails_helper'

RSpec.feature "SimulateCars", type: :feature do
  context 'Create a car with features' do
    Steps 'creating a car' do
      Given 'I am on the landing page' do
        visit '/'
      end
      And 'I fill in the make and year field' do
        fill_in 'make', with: 'Honda'
        fill_in 'year', with: '908'
      end
      And 'Click on the \'Make Car\' button' do
        click_button 'Make Car'
      end
      Then 'I should go to SimulateCars view' do
        expect(page).to have_content("Yer Car")
        expect(page).to have_content("Make: Honda")
        expect(page).to have_content("Year: 908")
        expect(page).to have_content("Speed: 0")
      end
      And 'I can click the speed up button' do
        click_link 'speed_up'
      end
      And 'It speeds up' do
        expect(page).to have_content("Speed: 10")
      end
    end
  end
end

require "rails_helper"

RSpec.feature "Signing out signed in users" do
  
  before do
      @john = User.create!(email: "john@example.com", password: "password")
      visit "/"
      
      click_link "sign in"
        fill_in "email", with: @john.email
        fill_in "Password", with: @john.password
        click_button  "Log in"
        
        scenario "sign out" do
            visit "/"
      
      click_link "sign out"
        expect(page).to have_content("signed out successfully.")
  end
 end
 end
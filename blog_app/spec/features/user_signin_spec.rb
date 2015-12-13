require "rails_helper"

RSpec.feature "Users Signin" do
  
  before do
      @john = User.create!(email: "john@example.com", password: "password")
  scenario "signin with valid credentials" do
      visit "/"
      
      click_link "sign in"
        fill_in "email", with: @john.email
        fill_in "Password", with: @john.password
        click_button  "Log in"
        
        expect(page).to have_content("signed in successfully.")
        expect(page).to have_content("signed in as#{@john.email}")
  end
 end
 end
 
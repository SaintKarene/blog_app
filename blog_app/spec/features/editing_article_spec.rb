require "rails_helper"

RSpec.feature "Editing an Article" do
    
    
    before do
        @article = Article.create(title: "The first article", body: "first article body")
    end
    
    scenario "a user updates an article" do 
        visit "/"
        
        click_link @article.title
        click_link "edit article"
        
        fill_in "Title", with: "updated article"
        fill_in "Body", with: "updated body of article"
        click_button "update article"
        
        expect(page).to have_content("Article has been updated")
        expect(page.current_path).to eq(article_path(@article))
    end
    
    scenario "a user fails to update an article" do 
        visit "/"
        
        click_link @article.title
        click_link "edit article"
        
        fill_in "Title", with: ""
        fill_in "Body", with: "updated body of article"
        click_button "update article"
        
        expect(page).to have_content("Article has not been updated")
        expect(page.current_path).to eq(article_path(@article))
    end
end
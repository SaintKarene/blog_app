require "rails_helper"

RSpec.feature "deleting an Article" do
    
    
    before do
        @article = Article.create(title: "The first article", body: "first article body")
    end
    
    scenario "a user deletes an article" do 
        visit "/"
        
        click_link @article.title
        click_link "delete article"
        
        
        expect(page).to have_content("Article has been deleted")
        expect(current_path).to eq(articles_path)
    end
    
end
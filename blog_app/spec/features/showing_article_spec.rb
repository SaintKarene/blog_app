require "rails_helper"

RSpec.feature "Showing an Article" do
    
    before do
        @article = Article.create(title: "The first article", body: "first article body")
    end
    
    scenario "display individual article" do 
        visit "/"
        
        click_link @article.title
        
        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(current_page).to eq(article_path(@article))
    end
end
class CommentsController < ApplicationController
 before_action :set_article
 
    
 def create
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user
    
    if @comment.save
        flash[:success] = "comment has been saved"
    else
        flash.now[:danger] = "comment has not been created"
    end
    redirect_to article_path(@article)
 end   
    
    private
    
    def comment_params
        params.require(:comment).permit(:body)
    end
    
    def set_article
      @article = Article.find(params[:article_id])  
    end
    
end

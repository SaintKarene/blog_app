class CommentsController < ApplicationController
 before_action :set_article

    def create
     unless current_user
    flash[:danger]= "Please sign in or sign up first."
    redirect_to new_user_session_path
    else
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
end

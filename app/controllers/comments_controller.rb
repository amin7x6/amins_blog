class CommentsController < ApplicationController

   def create
     @post = Post.find(params[:post_id])
    #  comment_params = params.require(:comment).permit(:body)
     @comment = @post.comments.create(comment_params)
    # redirect_to post_path(@post)
    #  @comment = Comment.new(comment_params)
     @comment.post = @post

     if @comment.save
       redirect_to post_path(@post), notice: 'Comment created!'
     else
       render '/'
     end
   end

   def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
   end

   private

   def comment_params
     params.require(:comment).permit(:body)
   end



end

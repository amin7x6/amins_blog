class PostsController < ApplicationController


  def index
    @posts = Post.order('id DESC').limit(7)
    @remaining_posts = @posts[1..6]
    @recent_post = @posts.first()
  end


   def new
     @post = Post.new
   end

   def show
    @post = Post.find params[:id]
    # comment_params = params.require(:comment).permit(:body)
    # @comment = @post.comments.create(comment_params)
    # @comments = Comment.all
    # @comment = Comment.new
  end

   def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to post_path(@post)
      else
        render :new
     end
   end

  def destroy
   @post = Post.find(params[:post_id])
   @comment = @post.comments.find(params[:id])
   @comment.destroy
   redirect_to post_path(@post)
  end

  #  comment_params = params.require(:comment).permit(:body)
   private

   def post_params
    params.require(:post).permit(:title, :body)
   end

end

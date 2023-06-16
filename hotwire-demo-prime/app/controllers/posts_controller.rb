class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  # def create
  #   @post = Post.create(post_params)
  #   redirect_to posts_path
  # end

  def create
    @post = Post.create(post_params)
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.append("posts", @post) }
      format.html { redirect_to posts_path }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end    
end

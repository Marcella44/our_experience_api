class PostsController < ApplicationController
  def index
    posts = Post.all
    render json: posts
  end

  def show
    post = Post.find(params[:id])
    render json: post
  end

  def create
    user = User.find(params[:user_id])
    post = user.posts.create(post_params)
    if post.save
      render json: post, status: :created 
    else
      render json: { error: "Post not created." }, status: :unprocessable_entity
    end
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      render json: post, status: 200
    else
      render json: { error: "Post not updated." }, status: :unprocessable_entity
    end
  end

   def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      render json: { message: "Post deleted." }
    else
      render json: { error: "Post not deleted." }
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :subject, :user_id, :forum_id)
  end
end

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [ :show ]

  def index
    # Show posts from current user and users they follow
    following_ids = current_user.following.pluck(:id)
    @posts = Post.where(user_id: [ current_user.id, *following_ids ]).order(created_at: :desc)
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path, notice: "Post created successfully!"
    else
      redirect_to root_path, alert: "Error creating post: #{@post.errors.full_messages.join(', ')}"
    end
  end

  def show
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end

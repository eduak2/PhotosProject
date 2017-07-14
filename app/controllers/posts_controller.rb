class PostsController < ApplicationController
  before_action :authenticate_user!, only:[:new , :create]

  def index
    @posts = Post.order(created_at: :desc).limit(10)
  end

  def new
    @post = Post.new

  end
  def show
    begin
      @post = Post.find(params[:id])
    rescue => e 
      redirect_to posts_path, flash: { alert: "The post has not been found" }
    end
  end

  def create
    @post =  current_user.posts.new(post_params)
    # @post =  Post.new(post_params)
    # @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, flash: { success: 'The post has been created' }
    else
        render :new
    end
  end

  #
  private
  def post_params
    params.require(:post).permit(:description, :photo)
  end


end

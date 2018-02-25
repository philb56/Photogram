class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Your post has been created."
      redirect_to @post
    else
      flash[:alert] = "You need an image to post here!"
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Your post has been updated."
      redirect_to(post_path(@post))
    else
      flash[:alert] = "Something is wrong with your form"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Your post has been deleted."
    redirect_to(posts_path)
    # if @post.destroy
    #   flash[:success] = "Your post has been deleted."
    #   redirect_to posts_path
    # else
    #   flash[:alert] = "Something is wrong with your delete"
    #   render :edit
    # end
  end

private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

end

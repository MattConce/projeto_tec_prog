class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Depoimento criado!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @user = current_user
    if @post.user.id  != @user.id
      redirect_to @user
    end 
  end

  def update
    @post = Post.find(params[:id])   

    if @post.update(post_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy 
    @post = Post.find(params[:id])
    @user = current_user
    if @post.user.id  == @user.id
      @post.destroy
    end 
    redirect_to @user
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
  end



end

class PostsController < ApplicationController
	def index
      @post = Post.all
      @user = current_user
  end

  def update
      @post = Post.find(params[:id])  
      if @post.update_attributes(post_params)
      redirect_to '/'
    else
      render 'edit'
    end
  end

  def edit
      @post = Post.find(params[:id])
  end

  def create
      Post.create(title: params[:create][:title],
        content: params[:create][:content],
        user_id: current_user.id)
      redirect_to '/'
  end

  def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to '/' , :notice => "Post deleted"
  end

end

def post_params
      params.require(:post).permit(:title, :content)
end
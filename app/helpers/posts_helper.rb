module PostsHelper

  def get_name(id)
     pid = Post.find(id).user_id
     User.all.find(pid).uname
  end


end

class PostsController < ApplicationController
  def new
  	# 空のモデルをビューへ渡す
  	@post = Post.new

  end

  def create
  	#ストロングパラメーターを使用
  	post = Post.new(post_params)
  	#DBへ保存する
  	post.save
  	#トップ画面へリダイレクト
  	redirect_to post_path(post.id) #詳細画面へリダイレクト
  end

  def index
  	@posts = Post.all
  end

  def show
      @post = Post.find(params[:id])
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
  end

	private
  	def post_params
  		params.require(:post).permit(:title, :body, :image)
end
end
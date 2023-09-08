class Public::PostsController < ApplicationController
 before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: '投稿が作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: '投稿が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: '投稿が削除されました。'
  end

  def search
  # 検索文字列が存在する場合のみ検索を実行する
  if params[:query].present?
    if params[:query_type] == "posts"
      @posts = Post.where("body LIKE ?", "%#{params[:query]}%")
    else
      @users = User.where("name LIKE ?", "%#{params[:query]}%")
      render "public/users/index" and return
    end
  else
    # 検索文字列が存在しない場合は、空の配列をセットする
    if params[:query_type] == "posts"
      @posts = []
    else
      @users = []
      render "public/users/index" and return
    end
  end
    @posts ||= []
    render "public/posts/index"
  end


  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :image, tag_ids: [])
  end

end

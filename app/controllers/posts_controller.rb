class PostsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  before_action :find_post, except: [:index, :create]

  def index
    render json: Post.page(params[:page])
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.category = post_category
    @post.save!

    head :created, location: post_path(@post.nanoid)
  end

  def show
    render json: @post
  end

  def update
    authorize! @post
    @post.update!(post_params)
  end

  def destroy
    authorize! @post
    @post.discard
  end

  private

  def find_post
    @post = Post.find_by!(nanoid: params[:id])
  end

  def post_params
    params.permit(:title, :body, :category_id, :team_id)
  end

  def post_category
    @_post_category ||= Category.find_by!(slug: params[:category_slug])
  end
end

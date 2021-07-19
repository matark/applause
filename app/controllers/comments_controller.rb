class CommentsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  before_action :find_comment, except: [:index, :create]
  before_action :find_post, only: [:index, :create]

  def index
    render json: @post.comments.page(params[:page])
  end

  def create
    @comment = @post.comments.create!(comment_params)
    head :created, location: comment_path(@comment)
  end

  def show
    render json: @comment
  end

  def destroy
    authorize! @comment
    @comment.destroy
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_post
    @post = Post.find_by!(nanoid: params[:post_id])
  end

  def comment_params
    params.permit(:content, :post_id, :parent_id)
  end
end

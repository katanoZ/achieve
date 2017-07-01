class CommentsController < ApplicationController
  before_action :set_comment, only:[:edit, :update, :destroy]
  before_action :set_blog, only:[:edit, :update]

  def create
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog

    respond_to do |format|
      if @comment.save
        flash.now[:notice] = "コメントを投稿しました。"
        format.html{redirect_to blog_path(@blog)}
        format.js {render :index}
      else
        #@comments = @blog.comments
        #format.html {render :template => "blogs/show"}
        format.html {render :new}
      end
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to blog_path(@blog), notice: "コメントを更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @comment.destroy
    flash.now[:notice] = "コメントを削除しました。"
    respond_to do |format|
      format.js {render :index}
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:blog_id, :content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
  def set_blog
    @blog = Comment.find(params[:id]).blog
  end
end

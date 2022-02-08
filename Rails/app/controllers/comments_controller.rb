class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:notice] = 'コメントを投稿しました'
      redirect_to comment.board
    else
      redirect_to :back, flash: {
        comment: comment,
        error_messages: comment.errors.full_messages
      }
    end

  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    is_update = @comment.update(comment_params)
    session[:test_session] = 'セッションデータです'
    cookies[:test_cookie] = 'クッキーだよ'
    if is_update == true
      @board = Board.find(@comment.board_id)
      session[:test_session] = nil # session削除
      cookies.delete :test_cookie # cookieの削除
      redirect_to @board
    else
      redirect_to :back, flash: {
        comment: @comment,
        error_messages: @comment.errors.full_messages,
        flash_name: 'flash_nameです',
        flash_param: params
      }
    end
  end

  def destroy
    # board = Board.find(params[:id])
    comment = Comment.find(params[:id])
    comment.delete
    # 紐づいていた掲示板画面に遷移させる
    redirect_to comment.board, flash: { notice: 'コメントが削除されました' }
  end

  private

  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment)
  end
end

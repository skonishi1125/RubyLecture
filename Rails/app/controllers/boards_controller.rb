class BoardsController < ApplicationController
  before_action :set_target_board, only: %i[show edit update destroy]

  def index
    # binding.pry
    # デフォルト25件
    # @boards = Board.page(params[:page]).per(20)

    @boards = params[:tag_id].present? ? Tag.find(params[:tag_id]).boards : Board.all
    @boards = @boards.page(params[:page])

  end
  
  
  def new
    # @board = Board.new
    @board = Board.new(flash[:board])
  end

  def create
    # board = Board.create(board_params)
    board = Board.new(board_params)
    if board.save # saveできた時の処理
      flash[:notice] = "「#{board.title}」の掲示板を作成しました"
      # binding.pry
      # 作ったボードidのページにリダイレクト
      redirect_to board
    else
      redirect_to new_board_path, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end
  end

  def show
    ## -- boardについての記載ないが、RailsがURLに沿った形を吐き出してくれているのかも。 -- ##
    # 掲示板に紐づいたcommentモデルを作成
    # @comment = @board.comments.new
    # 上の書き方だと、常にnewで作られた空のコメントが一覧に含まれることになる
    @comment = Comment.new(board_id: @board.id)

    # いいねボタン
    @board = Board.find(params[:id])
    # good = @board.good;
    # good = @board.good * 3
    # @board.good = good
    @board.good += 1
    # ↓を書くとshowにリダイレクト->showが表示されてもう一回リダイレクトの流れになる
    # redirect_to @board
  end

  def edit
  end

  def update
    # board = Board.find(params[:id])

    # モデルオブジェクトの、updateメソッドを使用する
    # board.update(board_params)
    # set_target_boardを使った時は、board = とboardに値が入っているわけではないのでインスタンスを@で直指定する
    # @board.update(board_params)
    

    #リダイレクト処理 /boards/:idのパスにリダイレクトされる
    # redirect_to board
    # redirect_to @board

    is_update = @board.update(board_params)
    if is_update == true
      redirect_to @board
    else
      redirect_to :back, flash: {
        board: @board,
        error_messages: @board.errors.full_messages
      }
    end

  end

  def destroy
    # board = Board.find(params[:id])
    # @board.delete
    @board.destroy

    redirect_to boards_path, flash: { notice: "「#{@board.title}」の掲示板が削除されました"}
  end

  private

  def board_params
    params.require(:board).permit(:name, :title, :body, :good, tag_ids: [])
  end

  def set_target_board
    @board = Board.find(params[:id])
  end

end
class UsersController < ApplicationController
  def edit

  end

  def show
  @user = User.find(:id)
  end

  def index
  end

  def new
    @user = User.new
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    user = User.new(user_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    user.save
    # 4. トップ画面へリダイレクト
    redirect_to root_path
  end

  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end

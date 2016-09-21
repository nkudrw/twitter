class TwittersController < ApplicationController
before_action :set_tweet, only: [:edit, :update, :destroy]
 
  def index
   @tweets = Tweet.all
   if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
   end
  end
  
  def new
   if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
  end

  def create
   @tweet = Tweet.new(tweets_params)
    if @tweet.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to twitters_path, notice: "ツイートしました！"
    else
      # 入力フォームを再描画します。
      render action: 'new'
    end
  end
  
  def edit
   
  end
  
  def update
   @tweet.update(tweets_params)
   redirect_to twitters_path, notice: "ツイートを編集しました！"
  end
  
  def destroy
   @tweet.destroy
   redirect_to twitters_path, notice: "ツイートを削除しました！"
  end
  
  def confirm
    @tweet = Tweet.new(tweets_params)
    render :new if @tweet.invalid?
  end
  
  private
   def tweets_params
     params.require(:tweet).permit(:content)
   end
   
   def set_tweet
    @tweet = Tweet.find(params[:id])
   end
end


class Api::TweetsController < Api::ApiController
    include TweetStats
    before_action :authenticate_token!
    before_action :set_tweet, only: [:update, :stats, :retweet, :quote, :bookmark, :unbookmark, :like, :unlike, :tweets_and_replies]
    skip_before_action :authenticate_token! , only:[:index]

    # GET /users/:user_id/tweets
    def index
        @tweets = Tweet.all
        render json: { tweet: @tweets }, status: :ok
    end

    def show
      @tweet = Tweet.find_by(id:)
      # if @tweet.nil?
      #   # Manejar el caso en el que el tweet no existe
      # else
      #   # Continuar con la lógica de mostrar el tweet
      # end
    end
    

    def tweets_and_replies
        @tweets_and_replies = Tweet.user_tweets_and_replies(@tweet.user_id)
        render json: { tweet: @tweets_and_replies }, status: :ok
    end


    # POST /tweets === tweets_path 
    def create
      @tweet = Tweet.new(tweet_params)

      if @tweet.save
        render status: :created
      else
        render status: :unprocessable_entity
      end
    end


    # PATCH/PUT /tweets/:id
    def update
      if @tweet.update(tweet_params)
        render status: :ok
      else
        render status: :unprocessable_entity
      end
    end


    def stats
      @stats_response = get_stats(@tweet)
      #render json: { stats: response }, status: :ok
    end


    # POST /tweets/:id/quote
    def quote
      original_tweet = @tweet
      current_user = tweet_params[:user_id]
  
      @quote_tweet = Tweet.new(user_id: current_user, body: tweet_params[:body], quote_id: original_tweet.id)

      if @quote_tweet.save
        render status: :created
      else
        render status: :unprocessable_entity
      end
      
    end


    # # POST /tweets/:id/retweet
    def retweet
      user = User.find(params[:user_id]) # Obtener el usuario desde los parámetros
      @retweet = @tweet.retweet(user)

      if @retweet
        render status: :created
      else
        render status: :unprocessable_entity
      end
    end


    # POST /tweets/:id/like
    def like
      user = User.find(params[:user_id])
      @like = @tweet.likes(user)

      unless @like
          render_errors(@like)
      end
  end
  
  def like

  @like = Like.create
  @like = Like.create(like_params)
  if @like.save
    render json: @like, status: :created
  else
    # Manejar errores de validación u otros casos
    render json: @like.errors, status: :unprocessable_entity
  end
end



    # DELETE /tweets/:id/unlike
    def destroy
        @unlike = Like.find_by(@like.id)
        unless @unlike&.destroy
            render json: { errors: ["Like not found or could not be deleted"] }, status: :unprocessable_entity
        end
    end


    # POST /tweets/:id/bookmark
    def bookmark
        @bookmark = Bookmark.create
        @bookmark = Bookmark.create(bookmark_params)
        if @bookmark.save
          render json: @bookmark, status: :created
        else
          # Manejar errores de validación u otros casos
          render json: @nookmark.errors, status: :unprocessable_entity
        end
      end
    
    
    # DELETE /tweets/:id/unbookmark
    def unbookmark
        @unbookmark = Bookmark.find_by(user_id: params[:user_id], tweet_id: @tweet.id)
  
        unless @unbookmark&.destroy
            render json: { errors: ['Bookmark not found.'] }, status: :unprocessable_entity
        end
    end
  
    private

    def set_tweet
        @tweet = Tweet.find(params[:id])
    end

    def tweet_params
        params.require(:tweet).permit(:body, :user_id)
    end

    def like_params
      params.require(:like).permit(:user_id, :tweet_id,)
    end

    def bookmark_params
      params.require(:bookmark).permit(:user_id, :tweet_id,)
    end
end


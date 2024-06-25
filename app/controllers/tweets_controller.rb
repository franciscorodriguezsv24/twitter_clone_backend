class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]

  # GET /tweets or /tweets.json
  def index
    @tweets = Tweet.all 
  end

  # GET /tweets/1 or /tweets/1.json
  def stats
    respond_to do |format|
      format.html # Render HTML template if needed
      format.json { render json: @tweet } # Render JSON response
    end
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
    respond_to do |format|
      format.html # Render HTML template if needed
      format.json { render json: @tweet } # Render JSON response
    end
  end

  def liked

    @like = Like.create(like_params)
    if @like.save
      render json: @like, status: :created
    else
      # Manejar errores de validación u otros casos
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # GET /tweets/1/edit
  def destroy_like
    @like = Like.find(params[:id])
  
    if @like.destroy
      render json: { message: 'Like deleted successfully' }, status: :created
    else
      render json: { error: 'Failed to delete like' }, status: :unprocessable_entity
    end
  end
  

  def bookmarked
    @bookmark = Bookmark.bookmarked(bookmark_params)
    @bookmar.save
  end

  def reply
    @tweet = Tweet.retweet(params[tweet_id:])
    @tweet.save
  end

  def quote
    @tweet = Tweet.create_quote_tweet(tweet_params)

    # def self.create_quote_tweet(user_id, text, tweet_id)

    # quote_tweet = Tweet.new(
    #   body: text, 
    #   user_id: user_id,
    #   quote_id: tweet_id
    # )
    # if quote_tweet.save
    # return quote_tweet
    # else nil 
  #    end
  # end 

  end 

  def retweet
    tweet = Tweet.find_by_id(params[:tweet_id])
      if tweet
    tweet.update_attribute(:retweet, true)
     # Resto del código
      else
    # Manejar el caso en el que no se encuentra el Tweet
    render json: { error: 'Tweet not found' }, status: :not_found
      end
  end 


  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.create(new_tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweet_url(@tweet), notice: "Tweet was successfully created." }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to tweet_url(@tweet), notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:body, :user_id, :retweet, :quote_id)
    end

    def new_tweet_params
      params.require(:tweet).permit(:body, :user_id)
    end

    def like_params
      params.require(:like).permit(:tweet_id, :user_id)
    end

    def bookmark_params
      params.require(:bookmark).permit(:tweet_id, :user_id)
    end
end


def like
  user = User.find(params[:user_id])
  @liked = @tweet.like(user)

end

#   unless @liked.valid?
#       @errors = @liked.errors
#       @klass = @liked.class
#       render partial: "shared/errors", klass: @klass, error_messages: @liked.errors.messages, status: :unprocessable_entity
#   end
# end
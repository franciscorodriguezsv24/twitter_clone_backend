if @liked.valid?
    json.like do
      json.extract! @liked, :id, :user_id, :tweet_id, :created_at, :updated_at
    end
  else
      json.errors @liked.errors.full_messages
  end
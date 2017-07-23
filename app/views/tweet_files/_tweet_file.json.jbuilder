json.extract! tweet_file, :id, :text, :date, :coordinates, :created_at, :updated_at
json.url tweet_file_url(tweet_file, format: :json)

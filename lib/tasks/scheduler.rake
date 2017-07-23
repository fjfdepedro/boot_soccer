namespace :scheduler do
  $twitter = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets[:twitter][:api_key]
      config.consumer_secret     = Rails.application.secrets[:twitter][:api_secret]
      config.access_token        = Rails.application.secrets[:twitter][:access_token]
      config.access_token_secret = Rails.application.secrets[:twitter][:access_token_secret]
  end
  task :search_1 do
    $twitter.search("'have signed', lang: 'en'", result_type: "recent").take(1).each do |tweet|
      #puts tweet.created_at
      tweet_p = (tweet.text).to_s.gsub(/RT @[\S]+/, '')
      tweet_p = (tweet_p).gsub(/#[\S]+/, '')
      tweet_p = (tweet_p).gsub(/RT /, '')
      tweet_p = tweet_p.gsub(/https?:\/\/[\S]+/, '')      
      #puts tweet.text
      puts tweet_p.strip
      $twitter.update(tweet_p.strip)
    end
  end
  task :search_2 do
    $twitter.search("'close to signing', lang: 'en'", result_type: "recent").take(1).each do |tweet|
      #puts tweet.created_at
      tweet_p = (tweet.text).to_s.gsub(/RT @[\S]+/, '')
      tweet_p = (tweet_p).gsub(/#[\S]+/, '')
      tweet_p = (tweet_p).gsub(/RT /, '')
      tweet_p = tweet_p.gsub(/https?:\/\/[\S]+/, '')
      #puts tweet.text
      puts tweet_p.strip
      $twitter.update(tweet_p.strip)
    end
  end
  task :search_3 do
    $twitter.search("'have rejected', lang: 'en'", result_type: "recent").take(1).each do |tweet|
      #puts tweet.created_at
      tweet_p = (tweet.text).to_s.gsub(/RT @[\S]+/, '')
      tweet_p = (tweet_p).gsub(/#[\S]+/, '')
      tweet_p = (tweet_p).gsub(/RT /, '')
      tweet_p = tweet_p.gsub(/https?:\/\/[\S]+/, '')
      #puts tweet.text
      puts tweet_p.strip
      $twitter.update(tweet_p.strip)
    end
  end
  task :recorder => :environment do
    $twitter.search("'have signed', lang: 'en'", result_type: "recent").take(50).each do |tweet|
      #puts tweet.created_at
      tweet_p = (tweet.text).to_s.gsub(/RT @[\S]+/, '')
      tweet_p = (tweet_p).gsub(/#[\S]+/, '')
      tweet_p = (tweet_p).gsub(/RT /, '')
      tweet_p = tweet_p.gsub(/https?:\/\/[\S]+/, '')      
      #puts tweet.text
      puts tweet_p.strip
      TweetFile.create(:text => tweet_p.strip, :date => tweet.created_at.to_date) if TweetFile.where({:text => tweet_p.strip}).count == 0
     end
    
    $twitter.search("'close to signing', lang: 'en'", result_type: "recent").take(50).each do |tweet|
      #puts tweet.created_at
      tweet_p = (tweet.text).to_s.gsub(/RT @[\S]+/, '')
      tweet_p = (tweet_p).gsub(/#[\S]+/, '')
      tweet_p = (tweet_p).gsub(/RT /, '')
      tweet_p = tweet_p.gsub(/https?:\/\/[\S]+/, '')
      #puts tweet.text
      puts tweet_p.strip
      TweetFile.create(:text => tweet_p.strip, :date => tweet.created_at.to_date) if TweetFile.where({:text => tweet_p.strip}).count == 0
    end
    
    $twitter.search("'have rejected', lang: 'en'", result_type: "recent").take(50).each do |tweet|
      #puts tweet.created_at
      tweet_p = (tweet.text).to_s.gsub(/RT @[\S]+/, '')
      tweet_p = (tweet_p).gsub(/#[\S]+/, '')
      tweet_p = (tweet_p).gsub(/RT /, '')
      tweet_p = tweet_p.gsub(/https?:\/\/[\S]+/, '')
      #puts tweet.text
      puts tweet_p.strip
      TweetFile.create(:text => tweet_p.strip, :date => tweet.created_at.to_date) if TweetFile.where({:text => tweet_p.strip}).count == 0
    end
  end
end

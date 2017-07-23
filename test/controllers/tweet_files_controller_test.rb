require 'test_helper'

class TweetFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tweet_file = tweet_files(:one)
  end

  test "should get index" do
    get tweet_files_url
    assert_response :success
  end

  test "should get new" do
    get new_tweet_file_url
    assert_response :success
  end

  test "should create tweet_file" do
    assert_difference('TweetFile.count') do
      post tweet_files_url, params: { tweet_file: { coordinates: @tweet_file.coordinates, date: @tweet_file.date, text: @tweet_file.text } }
    end

    assert_redirected_to tweet_file_url(TweetFile.last)
  end

  test "should show tweet_file" do
    get tweet_file_url(@tweet_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_tweet_file_url(@tweet_file)
    assert_response :success
  end

  test "should update tweet_file" do
    patch tweet_file_url(@tweet_file), params: { tweet_file: { coordinates: @tweet_file.coordinates, date: @tweet_file.date, text: @tweet_file.text } }
    assert_redirected_to tweet_file_url(@tweet_file)
  end

  test "should destroy tweet_file" do
    assert_difference('TweetFile.count', -1) do
      delete tweet_file_url(@tweet_file)
    end

    assert_redirected_to tweet_files_url
  end
end

require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should not save tweet without user_id' do
    tweet = Tweet.new(content: 'content')
    assert_not tweet.save, "Saved the user without a user_id"
  end

  test 'should not save tweet without content' do
    tweet = user.tweets.new()
    assert_not tweet.save, "Saved the user without a content"
  end

  def user
    @user = @user || User.create(email: 'test@test.com', password: 'password')
  end
end

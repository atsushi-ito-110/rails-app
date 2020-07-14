class Tweet < ApplicationRecord
  belongs_to :user
  has_many :tweet_images, dependent: :destroy
  validates :content, presence: true
  accepts_attachments_for :tweet_images, attachment: :image

  LIMIT = 20
  OFFSET = 0

  def self.search_limited(*args)
    options = args[0]
    tweets = Tweet.all.includes(%i[user tweet_images])
    return tweets.order(id: :DESC).limit(LIMIT).offset(OFFSET) if options.blank?

    offset = options[:offset].blank? ? OFFSET : options[:offset]
    tweets = tweets.where('content LIKE ?', "%#{options[:search]}%") unless options[:search].blank?
    tweets = tweets.where('user_id = ?', options[:user_id]) unless options[:user_id].blank?
    tweets = tweets.order(id: :DESC).limit(LIMIT).offset(offset)
    tweets
  end
end

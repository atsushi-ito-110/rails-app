class Tweet < ApplicationRecord
  belongs_to :user
  has_many :tweet_images, dependent: :destroy
  validates :content, presence: true
  accepts_attachments_for :tweet_images, attachment: :image

  LIMIT = 20
  OFFSET = 0

  def self.search_limited(*args)
    options = args[0]
    tweets = Tweet.all
    if options.blank?
      return tweets.order(id: :DESC).limit(LIMIT).offset(OFFSET)
    end
    offset =  options[:offset].blank? ? OFFSET : options[:offset]
    unless options[:content].blank?
      tweets = tweets.where("content LIKE ?", "%#{options[:content]}%")
    end
    unless options[:user_id].blank?
      tweets = tweets.where("user_id = ?", options[:user_id])
    end
    tweets = tweets.order(id: :DESC).limit(LIMIT).offset(offset)
    return tweets
  end

end

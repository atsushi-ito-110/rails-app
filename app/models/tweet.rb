class Tweet < ApplicationRecord
  belongs_to :user
  has_many :tweet_images, dependent: :destroy
  validates :content, presence: true
  accepts_attachments_for :tweet_images, attachment: :image
end

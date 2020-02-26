class Tweet < ApplicationRecord
  validates :content, presence: true #追記
  belongs_to :user
end

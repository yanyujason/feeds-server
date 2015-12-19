class Article < ActiveRecord::Base
  belongs_to :feed
  validates :title, presence: true
  validates :link, presence: true
  validates :content, presence: true
end

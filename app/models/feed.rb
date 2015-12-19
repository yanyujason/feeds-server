class Feed < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  validates :title, presence: true
  validates :link, presence: true
  validates :author, presence: true
  validates :source, presence: true
end

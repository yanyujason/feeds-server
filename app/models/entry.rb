class Entry < ActiveRecord::Base
  validates :title, presence: true
  validates :e_id, presence: true
end

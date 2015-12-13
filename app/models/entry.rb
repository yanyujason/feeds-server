class Entry
  include Mongoid::Document
  field :e_id, type: String
  field :title, type: String
  field :link, type: String
  field :content, type: String
  index({title: 1})
end

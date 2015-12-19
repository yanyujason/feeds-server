require 'test_helper'

class FeedTest < ActiveSupport::TestCase
  test 'should create feeds' do
    assert_difference('Feed.count', 2) do
      generate_feed().save
      generate_feed().save
    end
  end

  def teardown
    Feed.delete_all
  end
end

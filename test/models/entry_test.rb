require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  test "the truth" do
    assert true, 'it should be true'
  end

  test "should not save post without e_id" do
    entry = Entry.new
    entry.title = 'This is title'
    assert_not entry.save, 'e_id should not be empty!'
  end

  test "should not save post without title" do
    entry = Entry.new
    entry.e_id = 'http://guides.ruby-china.org/testing.html'
    assert_not entry.save, 'e_id should not be empty!'
  end
end

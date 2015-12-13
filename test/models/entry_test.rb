require 'test_helper'

class EntryTest < ActiveSupport::TestCase

  test 'should save entry' do
    assert_difference('Entry.count', 2) do
      Entry.create
      Entry.create
    end
  end

  test 'should delete entry' do
    Entry.create
    entry = Entry.create
    assert_difference('Entry.count', -1) do
      entry.destroy
    end
  end

  def after_teardown
    Entry.delete_all
  end

end

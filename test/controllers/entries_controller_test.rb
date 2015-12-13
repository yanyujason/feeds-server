require 'test_helper'

class EntriesControllerTest < ActionController::TestCase

  def setup
    @entry = generate_entry()
    @entry.save
  end

  test 'should get entries list' do
    generate_entry().save
    generate_entry().save

    @request.headers['Accept'] = 'application/json'
    get :index
    assert_response :success
    assert_not_nil assigns(:entries)
    assert_equal(3, assigns(:entries).count)
  end

  test 'should create entry' do
    assert_difference('Entry.count', 1) do
      @request.headers['Accept'] = 'application/json'
      post :create, entry: {title: 'Some title'}
    end
    assigns = assigns(:entry)

    assert_response :success
    assert_equal(assigns.title, 'Some title')
  end

  test 'should get special entry' do
    @request.headers['Accept'] = 'application/json'
    get :show, {'id' => @entry.id}

    assigns = assigns(:entry)

    assert_response :success
    assert_equal(assigns, @entry)
  end

  test 'should destroy entry' do
    assert_difference('Entry.count', -1) do
      @request.headers['Accept'] = 'application/json'
      delete :destroy, id: @entry.id
    end
    assert_response :success
  end

  def teardown
    Entry.delete_all
  end

  def generate_entry(title='Rails 程序测试指南', link='http://guides.ruby-china.org/testing.html',
                     content = '本文介绍 Rails 内建对测试的支持。')
    entry = Entry.new
    entry.title = title
    entry.link=link
    entry.content = content
    return entry
  end
end

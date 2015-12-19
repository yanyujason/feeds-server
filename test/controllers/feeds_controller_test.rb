require 'test_helper'

class FeedsControllerTest < ActionController::TestCase
  def setup
    @feed = feeds(:two)
  end

  test 'should get feeds list' do
    @request.headers['Accept'] = 'application/json'
    get :index
    assert_response :success
    assert_not_nil assigns(:feeds)
    assert_equal(assigns(:feeds).count, 2)
  end


  test 'should create feed' do
    link = 'http://guides.ruby-china.org/testing.html'
    source = 'http://guides.ruby-china.org/testing.html'
    author = 'MasterQiu'

    assert_difference('Feed.count', 1) do
      @request.headers['Accept'] = 'application/json'
      post :create, feeds: {link: link, title: 'Some title', source: source, author: author}
    end

    assigns = assigns(:feed)
    assert_response :success
    assert_not_nil assigns
    assert_equal(assigns.link, link)
  end

  test 'should get special feed' do
    @request.headers['Accept'] = 'application/json'
    get :show, {'id' => @feed.id}

    assigns = assigns(:feed)

    assert_response :success
    assert_not_nil assigns
    assert_equal(assigns.id, @feed.id)
  end

  test 'should destroy feed' do
    assert_difference('Feed.count', -1) do
      delete :destroy, id: @feed.id
    end
    assert_response :success
  end

  def tearDown
    @feed = nil
  end
end

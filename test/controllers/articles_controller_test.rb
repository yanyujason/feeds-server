require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  def setup
    @article = articles(:two)
    @feed = feeds(:one)
  end

  test 'should get articles list' do
    @request.headers['Accept'] = 'application/json'
    get :index, {'feed_id' => @feed.id}
    assert_response :success
    assert_not_nil assigns(:articles)
    assert_equal(3, assigns(:articles).count)
  end


  test 'should create article' do
    link = 'http://guides.ruby-china.org/testing.html'
    content = '本文介绍 Rails 内建对测试的支持。'

    assert_difference('Article.count', 1) do
      @request.headers['Accept'] = 'application/json'
      post :create, 'feed_id' => @feed.id, article: {link: link, title: 'Some title', content: content}
    end

    assigns = assigns(:article)
    assert_response :success
    assert_not_nil assigns
    assert_equal(assigns.link, link)
  end

  test 'should get special article' do
    @request.headers['Accept'] = 'application/json'
    get :show, {'feed_id' => @feed.id, 'id' => @article.id}

    assigns = assigns(:article)

    assert_response :success
    assert_not_nil assigns
    assert_equal(assigns.id, @article.id)
  end

  test 'should destroy article' do
    assert_difference('Article.count', -1) do
      delete :destroy, {'feed_id' => @feed.id, 'id' => @article.id}
    end
    assert_response :success
  end

  def tearDown
    @article = nil
  end

end

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  test 'should create article' do
    assert_difference('Article.count', 1) do
      generate_article(feed = feeds(:one)).save
    end
  end

  test 'should delete article' do
    article = Article.all[0]
    assert_difference('Article.count', -1) do
      article.destroy
    end
  end

  def teardown
    Article.delete_all
  end

end

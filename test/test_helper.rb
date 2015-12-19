ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def generate_feed(title='Rails 程序测试指南', link='http://guides.ruby-china.org/testing.html',
                    source = 'http://guides.ruby-china.org/testing.html', author='MasterQiu')
    feed = Feed.new
    feed.title = title
    feed.link=link
    feed.source = source
    feed.author = author
    return feed
  end

  def generate_article(title='Rails 程序测试指南', link='http://guides.ruby-china.org/testing.html',
                       content='Rails 程序测试指南', feed)
    article = Article.new
    article.title = title
    article.link=link
    article.content = content
    article.feed = feed
    return article
  end
end

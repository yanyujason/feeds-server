require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  test 'should get 2 entries' do
    @request.headers["Accept"] = 'application/json'
    get :index
    assert_response :success
    assert_not_nil assigns(:entries)
    assert_equal(assigns(:entries).count, 2)
  end

  test 'should create entry' do
    e_id = 'http://guides.ruby-china.org/testing.html'
    assert_difference('Entry.count') do
      @request.headers["Accept"] = 'application/json'
      post :create, entry: {e_id: e_id, title: 'Some title'}
    end
    assert_response :success
    assert_not_nil assigns(:entry)
    assert_equal(assigns(:entry).e_id, e_id)
  end

  test 'should get special entry' do
    @request.headers["Accept"] = 'application/json'
    get :show, {'id' => '1'}
    assert_response :success
    assert_not_nil assigns(:entry)
    assert_equal(assigns(:entry).e_id, 'http://guides.ruby-china.org/testing.html')
  end

  test 'should navigate to new entry page' do
    get :new
    assert_response :success
    assert_template :new
    assert_template layout: 'layouts/application'
  end
end

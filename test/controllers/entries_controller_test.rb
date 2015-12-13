require 'test_helper'

class EntriesControllerTest < ActionController::TestCase

  def setup
    @entry = entries(:three)
  end

  test 'should route to entries' do
    assert_routing '/entries', {controller: 'entries', action: 'index'}
  end

  test 'should get entries list' do
    @request.headers['Accept'] = 'application/json'
    get :index
    assert_response :success
    assert_not_nil assigns(:entries)
    assert_equal(assigns(:entries).count, 3)
  end


  test 'should create entry' do
    e_id = 'http://guides.ruby-china.org/testing.html'
    
    assert_difference('Entry.count', 1) do
      @request.headers['Accept'] = 'application/json'
      post :create, entry: {e_id: e_id, title: 'Some title'}
    end

    assigns = assigns(:entry)

    assert_response :success
    assert_not_nil assigns
    assert_equal(assigns.e_id, e_id)
  end

  test 'should route to entry' do
    assert_routing '/entries/1', {controller: 'entries', action: 'show', id: '1'}
  end

  test 'should get special entry' do
    @request.headers['Accept'] = 'application/json'
    get :show, {'id' => @entry.id}

    assigns = assigns(:entry)

    assert_response :success
    assert_not_nil assigns
    assert_equal(assigns.e_id, @entry.e_id)
  end

  test 'should route to new entry' do
    assert_routing '/entries/new', {controller: 'entries', action: 'new'}
  end

  test 'should navigate to new entry page' do
    get :new
    assert_response :success
    assert_template :new
    assert_template layout: 'layouts/application'
  end

  test 'should destroy entry' do
    assert_difference('Entry.count', -1) do
      delete :destroy, id: @entry.id
    end
    assert_response :success
  end

  def tearDown
    @entry = nil
  end
end

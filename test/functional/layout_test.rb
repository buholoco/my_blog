require 'test_helper'

class LayoutTest < ActionController::TestCase

  tests BlogsController

  test "should have container div" do
    get :index
      assert_select 'div#container'
  end

  test "should have header<div#logo&nav" do
    get :index
    assert_select 'header' do
      assert_select 'div#logo'
      assert_select 'nav'
    end
  end

  test "should have foot div" do
    get :index
    assert_select 'footer'
  end
end

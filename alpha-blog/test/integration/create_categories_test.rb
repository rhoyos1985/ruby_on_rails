require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.create(username: 'monica', email: 'monica@example.com', password: 'password', admin: true)
  end

  test 'get new category form and create category' do
    sign_in_as(@user, 'password')
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: 'sport' } }
      get categories_path
    end
    assert_template 'categories/index'
    assert_match 'sport', response.body
  end

  test 'invalid category submission results in failure' do
    sign_in_as(@user, 'password')
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: '' } }
    end
    assert_template 'categories/new'
    assert_select 'h5.alert_title'
    assert_select 'div.alert.error'
  end
end

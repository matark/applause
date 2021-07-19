require 'test_helper'
require 'helpers/sign_in_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include SignInHelper

  context 'routes' do
    should route(:get, '/posts').to(action: 'index')
    should route(:post, '/posts').to(action: 'create')
    should route(:get, '/posts/1').to(action: 'show', id: '1')
    should route(:put, '/posts/1').to(action: 'update', id: '1')
    should route(:patch, '/posts/1').to(action: 'update', id: '1')
    should route(:delete, '/posts/1').to(action: 'destroy', id: '1')
  end

  context 'logged in' do
    setup do
      sign_in create(:user)
    end

    context 'POST :create' do
      should 'responds created' do
        category = create(:category)
        post_params = { category_slug: category.slug }
        post_params.merge!({ title: build(:post).title })
        post posts_url, params: post_params
        assert_response :created
      end
    end
  end

  context 'logged out' do
    setup do
      create_list(:post, 5)
    end

    context 'GET :index' do
      should 'responds ok' do
        get posts_url
        assert_response :ok
      end
    end

    context 'GET :show' do
      subject { create(:post) }

      context 'resource is found' do
        setup do
          subject.touch(:published_at)
        end

        should 'responds ok' do
          get post_url(subject.nanoid)
          assert_response :ok
        end
      end

      context 'resource is not found' do
        should 'responds not_found' do
          get post_url(subject.nanoid)
          assert_response :not_found
        end
      end
    end
  end
end

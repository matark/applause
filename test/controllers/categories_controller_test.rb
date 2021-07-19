require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  context 'routes' do
    should route(:get, '/categories').to(action: 'index')
    should route(:get, '/categories/emojis').to(action: 'show', slug: 'emojis')
  end

  context 'GET :index' do
    should 'responds ok' do
      get categories_url
      assert_response :ok
    end
  end

  context 'GET :show' do
    subject { create(:category) }

    context 'resource is found' do
      should 'responds ok' do
        get category_url(subject.slug)
        assert_response :ok
      end
    end

    context 'resource is not found' do
      should 'responds not_found' do
        get category_url(SecureRandom.hex)
        assert_response :not_found
      end
    end
  end
end

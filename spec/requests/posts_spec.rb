require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'get index action' do
    before(:example) do
      get '/users/1/posts' # Replace :user_id with actual user ID
    end

    it 'response status should be correct for index' do
      expect(response).to have_http_status(:success)
    end

    it 'correct template should be rendered for index' do
      expect(response).to render_template(:index)
    end

    it 'response body should include the correct placeholder for index' do
      expect(response.body).to include('Post')
    end
  end

  describe 'get show action' do
    before(:example) do
      get '/users/1/posts/1' # Replace :user_id and :post_id with actual IDs
    end

    it 'response status should be correct for show' do
      expect(response).to have_http_status(:success)
    end

    it 'correct template should be rendered for show' do
      expect(response).to render_template(:show)
    end

    it 'response body should include the correct placeholder for show' do
      expect(response.body).to include('Post')
    end
  end
end

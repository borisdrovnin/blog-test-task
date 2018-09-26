require 'rails_helper'

RSpec.describe 'Posts API', type: :request do

  # Test suite for POST /todos/create
  describe 'POST /post/create' do
    # valid payload
    let(:valid_attributes) { { login: 'a', content: 'b', title: 'c' }.to_json }
    let(:invalid_attributes) { { title: 'c' }.to_json }

    context 'when the request is valid' do
      before do
        headers = { "CONTENT_TYPE" => "application/json" }
        post '/post/create', :params => valid_attributes , :headers => headers
      end

      it 'creates a post' do
        expect(json[:title]).to eq('c')
        expect(json[:content]).to eq('b')
        expect(json[:ip]).not_to be_blank
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before do
        headers = { "CONTENT_TYPE" => "application/json" }
        post '/post/create', :params => invalid_attributes , :headers => headers
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/The property '#\/' did not contain a required property of 'login'/)
      end
    end
  end
end
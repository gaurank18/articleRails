require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:each) do
    @user = create(:user)
    login_as(@user)
    @post = create(:post, user: @user)
  end
  context "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  context "POST #create" do

    it 'should create a new post if values are values are correct' do
    @post = create(:post, user: @user)
      expect(@post).to be_valid
    end

    it 'should give unprocessable entity error if title is not given' do
      post :create, params: { post: { title: nil, description: "loremipsum loremipsum loremipsum loremipsum" } }
      expect(response.status).to eq(422)
    end

    it 'should give unprocessable entity error if title is not given' do
      post :create, params: { post: { title: nil, description: "ncxcxcxil" } }
      expect(response.status).to eq(422)
    end

    it 'should give unprocessable entity error if title is not given' do
      post :create, params: { post: { title: nil, description: "ncxcxcxil" } }
      expect(response.status).to eq(422)
    end

    it 'should give unprocessable entity error if description is not given' do
      post :create, params: { post: { title: "tetest", description: nil } }
      expect(response.status).to eq(422)
    end

    it 'should give unprocessable entity error if title is less then 3 character' do
      post :create, params: { post: { title: Faker::String.random(length: 2), description: "ddddddddddddd"} }
      expect(response.status).to eq(422)
    end

    it 'should give unprocessable entity error if title is more then 50 character' do
      post :create, params: { post: { title: Faker::String.random(length: 60), description: "ddddddddddddd"} }
      expect(response.status).to eq(422)
    end

    it 'should give unprocessable entity error if description is less then 10 character' do
      post :create, params: { post: { title: "new title", description: Faker::String.random(length: 5)} }
      expect(response.status).to eq(422)
    end

    it 'should give unprocessable entity error if description is more then 300 character' do
      post :create, params: { post: { title: "titled", description: Faker::String.random(length: 305)} }
      expect(response.status).to eq(422)
    end
  end

  context "GET #show" do
    it 'should get a particular post' do
      get :show, params: { id: @post.to_param }
      expect(response).to have_http_status(:success)
    end
  end

  context "PUT #update" do
    it "should update the title" do
      put :update, params: { id: @post.id, post: { title: "nil" } }
      p response
      expect(response.status).to eq(200)
    end
    it "should update the description" do
      put :update, params: { id: @post.id, post: { title: Faker::String.random } }
      expect(response.status).to eq(200)
    end
    it 'should give unprocessable entity error if title is not given' do
      put :update, params: { id: @post.id, post: { title: nil } }
      expect(response.status).to eq(422)
    end

    it 'should give unprocessable entity error if description is not given' do
      put :update, params: { id: @post.id, post: { description: nil } }
      expect(response.status).to eq(422)
    end

    it 'should give unprocessable entity error if title is less then 3 character' do
      put :update, params: { id: @post.id, post: { title: Faker::String.random(length: 2)} }
      expect(response.status).to eq(422)
    end

    it 'should give unprocessable entity error if title is more then 50 character' do
      put :update, params: { id: @post.id, post: { title: Faker::String.random(length: 60)} }
      expect(response.status).to eq(422)
    end

    it 'should give unprocessable entity error if description is less then 10 character' do
      put :update, params: { id: @post.id, post: { description: Faker::String.random(length: 5)} }
      expect(response.status).to eq(422)
    end

    it 'should give unprocessable entity error if description is more then 300 character' do
      put :update, params: { id: @post.id, post: { description: Faker::String.random(length: 305)} }
      expect(response.status).to eq(422)
    end
  end
  context "destroy" do
    it "should delete the post" do
      delete :destroy, params: { id: @post.id }
      p @post
      p response
      # expect(response).to have_http_status(:success)
      expect(response).to redirect_to posts_path
    end
  end
end

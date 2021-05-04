require 'rails_helper'

RSpec.describe Post, type: :model do
  context "associations" do
    it "belongs to user " do
      t = Post.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end
    it "has many comments" do
      t = Post.reflect_on_association(:comments)
      expect(t.macro).to eq(:has_many)
    end
  end
  context "validations" do
    before(:all) do
      # @Post = Post.new(title: "Assssssny", description: "Lorem@issLorem@issLorem@iss.psum", user_id: "97")
      @Post = create(:Post)
      p @Post
    end
    it 'has a Post id' do
      expect(@Post.id).to be_present
    end
    it 'has a title' do
      expect(@Post.title).to be_present
    end
    it 'has a description' do
      expect(@Post.description).to be_present
    end
    it 'has a user id' do
      expect(@Post.user_id).to be_present
    end
    it 'has a username atleast 3 character long and less than 25 characters' do
      expect(@Post.title).to have_attributes(size: (be > 2) & (be <= 50)) # passes
    end
    it 'has a username atleast 3 character long and less than 25 characters' do
      expect(@Post.description).to have_attributes(size: (be > 9) & (be <= 300)) # passes
    end
  end
end

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "associations" do
    context "validations" do
      before(:all) do
        # @comment = Comment.create(body: "Dddddddddddddddddd", post_id: "105")
        @comment = create(:comment)
        p @comment
      end
      it 'has a post id' do
        expect(@comment.post_id).to be_present
      end
      it 'has a body' do
        expect(@comment.body).to be_present
      end
    end
  end
end

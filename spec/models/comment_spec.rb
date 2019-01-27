require 'rails_helper'

describe Comment do
  context 'when a user leaves a review' do
    let(:user) { @user = FactoryBot.create(:user) }
    let(:product) { @product = FactoryBot.create!(:product) }
    let(:comment) { Comment.create(user_id: user.id, product_id: product.id, body: 'Comment') }

    it 'not valid without a rating' do
      comment.rating = nil
      expect(comment).to_not be_valid
    end

    it 'not valid without a body' do
      comment.body = nil
      expect(comment).to_not be_valid
    end

    it "not valid without a product" do
      expect(product.comments.new(user_id: user.id, product_id: nil, body: 'Comment')).to_not be_valid
    end

    it 'not valid without a user' do
      expect(product.comments.new(user_id: nil, product_id: product.id, body: 'Comment')).to_not be_valid
    end

    it 'is valid if everything completed' do
      expect(product.comments.new(user_id: user.id, product_id: product.id, body: 'Comment', rating:3)).to be_valid
    end
  end
end

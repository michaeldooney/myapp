require 'rails_helper'

describe ProductsController, type: controller: do
  let(:user) { @user = FactoryBot.create(:user) }
  let(:product) { @product = FactoryBot.create!(:product) }

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'shows products page' do
      get :show, params: {id: product.id}
      expect(response).to be_ok
    end
  end

  describe 'GET #new' do
    before do
      sign_in user
    end
    it 'redirects to new product page' do
      get :new, params: {id: product.id}
      expect(response).to be_ok
    end
  end

  describe 'GET #edit' do
    before do
      sign_in user
    end
    it 'redirects to edit product page' do
      get :edit, params: {id: product.id}
      expect(response).to be_ok
    end
  end

  describe 'POST #create' do
    before do
      sign_in user
    end
    it 'creates a new product' do
      expect(response).to be_successful
    end
  end

  describe 'PATCH #update' do
    before do
      sign_in user
    end
    it 'updates product' do
      article_params = FactoryBot.attributes_for(:product)
      expect{ patch :update, params: {id: @product.id, product: article_params }
      }.to change(Product,:count).by(0)
      expect(flash[:notice]).to eq 'product was successfully updated.'
    end
  end

  describe 'DELETE #destroy' do
    before do
      sign_in user
    end
    it 'deletes product' do
      delete :destroy, params: { id: product.id }
      expect(response).to redirect_to products_url
    end
  end
end

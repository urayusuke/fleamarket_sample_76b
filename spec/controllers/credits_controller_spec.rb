require 'rails_helper'

describe CreditsController do
  let(:user) { create(:user) }

  describe '#new' do

    context 'ログインしている場合' do
      before do
        login user
      end

      it 'credits/new.html.hamlに遷移すること' do
        get :new, params: { user_id: 1 }
        expect(response).to render_template :new
      end
    end

    context 'ログインしていない場合' do
      before do
        get :new, params: { user_id: 1 }
      end

      it 'root_path に遷移すること' do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
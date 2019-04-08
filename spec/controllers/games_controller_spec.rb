require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe '#index' do
    it 'responds successfully' do
      get :index
      aggregate_failures do
        expect(response).to be_successful
        expect(response).to have_http_status '200'
      end
    end

    context 'when there is no data' do
      it 'assings games an empty array' do
        get :index
        expect(assigns(:games)).to be_empty
      end
    end

    context 'when there is data' do
      before do
        @games = create_list(:game, 10)
      end

      it 'assigns games array' do
        get :index
        expect(assigns(:games).count).to eq 10
      end
    end
  end

  describe '#show' do
    before do
      @game = create(:game)
    end

    it 'responds successfully' do
      get :show, params: { id: @game.id }
      expect(response).to be_successful
    end

    it 'no show with a nonexistent game' do
      expect{ get :show, params: { id: 50 } }
        .to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe '#new' do
    it 'render the new game template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new game' do
      get :new
      expect(assigns(:game)).to be_a_new(Game)
    end
  end

  describe '#create' do   
    context 'with valid attributes' do
      it 'adds a game' do
        game_params = attributes_for(:game)
        expect{ post :create, params: { game: game_params } }
          .to change(Game, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not add a game' do
        game_params = attributes_for(:game, :invalid)
        expect { post :create, params: { game: game_params } }
          .to_not change(Game, :count)
      end
    end
  end

  describe '#destroy' do
    before do
      @game = create(:game)
    end

    it 'delete a game' do
      expect { delete :destroy, params: { id: @game.id } }
        .to change(Game, :count).by(-1)
    end
  end
end

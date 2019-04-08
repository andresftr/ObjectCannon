require 'rails_helper'

RSpec.describe RubyObjectsController, type: :controller do
  describe '#create' do
    before do
      @game = create(:game)
    end

    context 'with valid attributes' do
      it 'adds an object' do
        object_params = attributes_for(:ruby_object).merge(attacker: @game.turn)
        expect { post :create, params: { game_id: @game.id,
                                         ruby_object: object_params } }
          .to change(@game.ruby_objects, :count).by(1)
      end

      it 'assigns a newly created item as @ruby_object' do
        object_params = attributes_for(:ruby_object).merge(attacker: @game.turn)
        post :create, params: { game_id: @game.id, ruby_object: object_params }

        expect(assigns(:ruby_object)).to be_a(RubyObject)
        expect(assigns(:ruby_object)).to be_persisted
      end
    end

    context 'with invalid attributes' do
      it 'does no add an object' do
        object_params = attributes_for(:ruby_object, :invalid)
        expect { post :create, params: { game_id: @game.id,
                                         ruby_object: object_params } }
          .to_not change(@game.ruby_objects, :count)
      end
    end

    context 'change the turn in a game' do
      it 'adds two objects in a game' do
        object_params = attributes_for(:ruby_object).merge(attacker: @game.turn)
        post :create, params: { game_id: @game.id, ruby_object: object_params }
        second_object = attributes_for(:ruby_object).merge(attacker: @game.turn)
        expect { post :create, params: { game_id: @game.id,
                                         ruby_object: object_params } }
          .to change(@game.ruby_objects, :count).by(1)
      end
    end
  end
end

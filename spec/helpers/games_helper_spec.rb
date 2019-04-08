require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the GamesHelper. For example:
#
# describe GamesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe GamesHelper, type: :helper do
  describe '#number_attributes' do
    it 'return a number between 1 and 25' do
      expect(number_attributes).to be_between(1, 25)
    end

    it 'no return a number greater than 25' do
      expect(number_attributes).to_not be > 25
    end
  end

  describe '#value_to_sum' do
    it 'return a valid random value' do
      values = [0, 2, 5, 10, 20]
      expect(values).to include(value_to_sum)
    end
    
    it 'return a value less than or equal to 20' do
      expect(value_to_sum).to be <= 20
    end

    it 'no return a value greater than 20' do
      expect(value_to_sum).to_not be > 20
    end
  end

  describe '#winner_health' do
    before do
      @game = build(:game)
    end

    it 'return the rival health as the winner' do
      @game.hit_points = 25
      @game.hit_points_rival = 50
      expect(winner_health(@game)).to be(@game.hit_points_rival)
    end

    it 'return the player one health as the winner' do
      @game.hit_points = 60
      @game.hit_points_rival = 50
      expect(winner_health(@game)).to be(@game.hit_points)
    end

    it 'no return a invalid winner health' do
      @game.hit_points = 25
      @game.hit_points_rival = 50
      expect(winner_health(@game)).to_not be(@game.hit_points)
    end
  end

  describe '#winner' do
    before do
      @game = build(:game)
    end

    it 'return the rival name as the winner' do
      @game.hit_points = 25
      @game.hit_points_rival = 50
      expect(winner(@game)).to be(@game.rival)
    end

    it 'return the player one name as the winner' do
      @game.hit_points = 25
      @game.hit_points_rival = 10
      expect(winner(@game)).to be(@game.name)
    end

    it 'no return a invalid winner health' do
      expect(winner(@game)).to_not be(@game.name)
    end
  end

  describe '#show_object_generator' do
    before do
      @game = build(:game)
    end

    it 'show message with the player one name as the winner' do
      @game.hit_points = 25
      @game.hit_points_rival = 0
      expect(show_object_generator(@game)).to eq("#{@game.name} is the winner.")
    end

    it 'show message with the rival name as the winner' do
      @game.hit_points = 0
      @game.hit_points_rival = 10
      expect(show_object_generator(@game)).to eq("#{@game.rival} is the winner.")
    end

    it 'no show message with the loser name' do
      @game.hit_points = 25
      @game.hit_points_rival = 0
      expect(show_object_generator(@game)).to_not eq("#{@game.rival} is the winner.")
    end

    # it 'render the generator in the show view' do
    #   expect(show_object_generator(@game))
    #     .to render_template(partial: 'ruby_objects/generator')
    # end
  end
end

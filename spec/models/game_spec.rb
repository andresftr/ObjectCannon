require 'rails_helper'

RSpec.describe Game, type: :model do
  it 'valid with name, rival and by default the hit points and turn' do
    game = build(:game)
    expect(game).to be_valid
  end

  it 'is invalid without a name' do
    client = build(:game, :invalid)
    client.valid?
    expect(client.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a rival' do
    client = build(:game, :without_rival)
    client.valid?
    expect(client.errors[:rival]).to include("can't be blank")
  end

  it 'is invalid a name with a length less than 3' do
    client = build(:game, name: 'an')
    client.valid?
    expect(client.errors[:name]).to include('is too short (minimum is 3 characters)')
  end

  it 'is invalid a rival with a length less than 3' do
    client = build(:game, rival: 'an')
    client.valid?
    expect(client.errors[:rival]).to include('is too short (minimum is 3 characters)')
  end

  it 'is invalid a name with a length more than 25' do
    client = build(:game, name: 'pedro luis miguel de los santoszzzzzzzz')
    client.valid?
    expect(client.errors[:name]).to include('is too long (maximum is 25 characters)')
  end

  it 'is invalid a rival with a length more than 25' do
    client = build(:game, rival: 'pedro luis miguel de los santoszzzzzzzzzz')
    client.valid?
    expect(client.errors[:rival]).to include('is too long (maximum is 25 characters)')
  end

  it 'is invalid with a name and a rival with the same name' do
    client = build(:game, :same_name)
    client.valid?
    expect(client.errors[:rival]).to include("can't have the same name as player one")
  end
end

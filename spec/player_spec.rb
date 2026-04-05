# frozen_string_literal: true

require_relative '../lib/player'

RSpec.describe Player do
  subject(:player) { described_class.new('Alice', 'X') }

  it 'exposes name and token' do
    expect(player.name).to eq('Alice')
    expect(player.token).to eq('X')
  end
end

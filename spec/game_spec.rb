# frozen_string_literal: true

require_relative '../lib/game'

RSpec.describe Game do
  let(:player_x) { Player.new('P1', 'X') }
  let(:player_o) { Player.new('P2', 'O') }

  describe '#won?' do
    subject(:game) { described_class.new(player_x, player_o) }

    it 'is true when any win line is filled by that player' do
      described_class::WIN_CONDITIONS.each do |line|
        board = Array.new(9, ' ')
        line.each { |i| board[i] = 'X' }
        game.instance_variable_set(:@board_state, board)
        expect(game.won?(player_x)).to be true
      end
    end

    it 'is false for an empty board' do
      expect(game.won?(player_x)).to be false
      expect(game.won?(player_o)).to be false
    end

    it 'is false when the line is incomplete' do
      game.instance_variable_set(:@board_state, %w[X X O O O X X O X])
      expect(game.won?(player_x)).to be false
    end

    it 'is false when only the other player has completed a line' do
      # Top row is X; O has no full line (e.g. O O X / O X O).
      game.instance_variable_set(:@board_state, %w[X X X O O X O X O])
      expect(game.won?(player_o)).to be false
      expect(game.won?(player_x)).to be true
    end
  end

  describe '#player_turn (draw scenario)' do
    # Full board, no winner — X O X / O O X / X X O
    let(:draw_moves) { %w[a1 b1 a3 b2 b3 a2 c1 c3 c2] }

    it 'sets cats_game after a full board with no winner' do
      game = described_class.new(player_x, player_o)
      allow(game).to receive(:announce_beginning_of_turn)
      allow(game).to receive(:render_board)
      allow(game).to receive(:pause)
      allow(game).to receive(:space_validation).and_return(*draw_moves)

      draw_moves.length.times { game.player_turn }

      expect(game.cats_game?).to be true
    end
  end

  describe '#player_turn (win scenario)' do
    it 'does not set cats_game when the last move wins' do
      game = described_class.new(player_x, player_o)
      allow(game).to receive(:announce_beginning_of_turn)
      allow(game).to receive(:render_board)
      allow(game).to receive(:pause)

      winning_sequence = %w[a1 b1 a2 b2 a3]
      allow(game).to receive(:space_validation).and_return(*winning_sequence)

      winning_sequence.length.times { game.player_turn }

      expect(game.cats_game?).to be false
      expect(game.won?(player_x)).to be true
    end
  end
end

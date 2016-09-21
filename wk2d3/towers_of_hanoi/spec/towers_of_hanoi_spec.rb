require 'towers_of_hanoi'

describe TowersOfHanoi do

let (:board) {TowersOfHanoi.new}

    describe '#initialize' do

      it 'creates valid board' do
        expect(board.pegs[0]).to eq([1,2,3])
        expect(board.pegs[1..2]).to eq([[9,9,9],[9,9,9]])
      end
    end


    describe '#is_valid?' do

      it 'returns false for out of range move positions' do
        expect(board.is_valid?(-1,4)).to eq(false)
        expect(board.is_valid?(0,2)).to eq(true)
      end


      it 'returns false when trying to move smaller disc to bigger' do
        board.move(0,2)
        expect(board.is_valid?(0,2)).to eq(false)
      end
    end

    describe '#won?' do
      it 'recognizes a winning board' do
        board.move(0,1)
        board.move(0,2)
        board.move(1,2)
        board.move(0,1)
        board.move(2,0)
        board.move(2,1)
        board.move(0,1)
        expect(board.won?).to eq(true)
      end
    end


end

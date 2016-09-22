require 'card.rb'
require 'deck'
require 'hand'
require 'player'

describe 'poker' do

  describe Card do
    let(:ace_of_spades) {Card.new(:A, :spades)}

    it 'creats a valid card with two properties' do
      expect(ace_of_spades.value).to eq(:A)
      expect(ace_of_spades.suit).to eq(:spades)
    end
  end

  describe Deck do
    let (:deck) {Deck.new}

    it 'populates 52 card deck' do
      expect(deck.deck.length).to eq(52)
    end
    it 'each card is a numerical value' do
      expect(deck.deck[0].value.is_a?(Integer)).to eq(true)
    end
    it 'each card has a suit symbol' do
      expect(deck.deck[0].suit.is_a?(Symbol)).to eq(true)
    end

    it 'checks if every card is uniq in the deck' do
      decomp_deck = deck.deck.map{|card| [card.value, card.suit]}
      expect(decomp_deck.uniq.length).to eq(52)
    end
  end

  describe Hand do

    describe "find royal flush" do
      royal_flush = [Card.new(14, :spades), Card.new(13, :spades),
                     Card.new(12, :spades) ,Card.new(11, :spades),Card.new(10, :spades)]

      let(:royal) {Hand.new(royal_flush)}
      it 'finds royal flush' do
        expect(royal.type_of_hand).to eq(9)
      end
    end

    describe '#find_straight_flush' do
      straight_flush = [Card.new(9, :spades), Card.new(8, :spades),
                        Card.new(7, :spades) ,Card.new(6, :spades),Card.new(5, :spades)]
      let(:straight) {Hand.new(straight_flush)}
      it 'finds straight flush' do
        expect(straight.type_of_hand).to eq(8)
      end
    end

    describe "find four of a kind" do
      four_of_a_kind = [Card.new(14, :spades), Card.new(14, :spades),
                     Card.new(14, :spades) ,Card.new(14, :spades),Card.new(10, :hearts)]

      let(:four) {Hand.new(four_of_a_kind)}
      it 'finds four of a kind' do
        expect(four.type_of_hand).to eq(7)
      end
    end

    describe "find full house" do
      full_house = [Card.new(14, :spades), Card.new(14, :spades),
                    Card.new(14, :spades) ,Card.new(11, :spades),Card.new(11, :hearts)]

      let(:full) {Hand.new(full_house)}
      it 'finds full house' do
        expect(full.type_of_hand).to eq(6)
      end
    end
    describe "find two pair" do
      two_pair = [Card.new(14, :spades), Card.new(14, :spades),
                    Card.new(11, :spades) ,Card.new(11, :spades),Card.new(8, :hearts)]

      let(:two) {Hand.new(two_pair)}
      it 'finds two pair' do
        expect(two.type_of_hand).to eq(2)
      end
    end
  end

  describe Player do
    hand1 = [Card.new(14, :spades), Card.new(14, :spades),
                  Card.new(11, :spades) ,Card.new(11, :spades),Card.new(8, :hearts)]
    hand2 = [Card.new(14, :spades), Card.new(14, :spades)]

    let(:player1){Player.new(hand1)}

    it 'Create player with pot and cards' do
      expect(player1.personal_pot).to eq(100)
      expect(player1.hand).to eq(hand1)
    end

    it 'deletes cards at positions passed in' do
      player1.delete_cards([2,3,4])
      expect(player1.hand.length).to eq(2)
    end

    it 'adds cards to hand' do
      player1.delete_cards([1,2])
      player1.add_cards(hand2)
      expect(player1.hand).to eq(hand1)
    end

    it 'places bet and subtacts money from pot' do
      player1.bet(40)
      expect(player1.personal_pot).to eq(60)
    end

    it "raises an argument error when given a non-affordable bet" do
      expect { player1.bet(5000) }.to raise_error(ArgumentError)
    end


  end
end

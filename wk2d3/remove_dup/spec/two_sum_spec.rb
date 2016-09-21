require 'rspec'
require 'two_sum'

describe 'two_sum' do
  array1 = [-1, 0,2,3,4,5]
  array2 = [-1, 1, 5, 6, -5]

  it 'returns empty array if no sum to zero found' do
      expect(two_sum(array1)).to be_empty
  end

  it 'return correct index matches when sum to zero' do
    expect(two_sum(array2)).to eq([[0,1], [2,4]])
  end

  it 'does not return duplicate index matches' do
    expect(two_sum(array2)).to eq(two_sum(array2).uniq)
  end

end

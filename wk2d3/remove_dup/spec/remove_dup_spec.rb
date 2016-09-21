require 'rspec'
require 'remove_dup'

describe 'remove_dup' do
  it "returns empty arr if nothing given" do
    expect(remove_dup([])).to eq([])
  end

  it 'removes duplicate numbers' do
    expect(remove_dup([1,2,3,3,2,1])).to eq([1,2,3])
  end

  string1 = ['abc','abc','efg']

  it 'removes duplicate strings' do
    expect(remove_dup(string1)).to eq (['abc','efg'])
  end

end

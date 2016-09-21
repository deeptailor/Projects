require "stock_picker"

describe 'stock_picker' do
  days = [1,2,3,4,5,6,7,8,9,10]
  days1 = [10,9,8,7,6,5,4,3,1,2]

  it 'picks biggest difference in an increasing array' do
    expect(stock_picker(days)).to eq([0,9])
  end

  describe 'picks biggest difference in mixed array' do
    it 'ensures buy day is before sell day' do
      expect(stock_picker(days1)).to eq([8,9])
    end
  end
end

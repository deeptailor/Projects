require 'transpose'

describe 'my_transpose' do
  array = [
          [0, 1, 2],
          [3, 4, 5],
          [6, 7, 8]
          ]

  trans_array = [ [0, 3, 6],
                  [1, 4, 7],
                  [2, 5, 8] ]

  array2 = [
          [0, 1, 2, 3],
          [4, 5, 6, 7],
          [8, 9, 10, 11],
          [12, 13, 14, 15]
          ]

  trans_array2 = [[0,4,8,12],
                  [1,5,9,13],
                  [2,6,10,14],
                  [3,7,11,15]]

  it 'switches rows and colums for a 3x3 array' do
    expect(my_transpose(array)).to eq(trans_array)
  end

  it 'switches rows and columns for a 4x4 array' do
    expect(my_transpose(array2)).to eq(trans_array2)
  end
end

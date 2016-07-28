require_relative 'flat'

RSpec.describe Flat do
  it 'flattens arbitrarily nested arrays' do
    expect(Flat.flatten([[1, 2, [3]], 4])).to eq([1, 2, 3, 4])
    expect(Flat.flatten([[5, [2, 3]], 4])).to eq([5, 2, 3, 4])
    expect(Flat.flatten([[5, []], 4])).to eq([5, 4])
  end

  it 'returns the same when given a flat array' do
    expect(Flat.flatten([3, 4, 5])).to eq([3, 4, 5])
  end

  it 'returns the same when given an empty array' do
    expect(Flat.flatten([])).to eq([])
  end

  it 'only accepts arrays as input' do
    expect{Flat.flatten('hello')}.to raise_error(ArgumentError)
  end
end

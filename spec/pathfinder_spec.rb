require_relative '../pathfinder'

RSpec.describe PathFinder do
  let(:example) do
    [
      [1, 1, 1, 0],
      [1, 0, 1, 0],
      [1, 0, 1, 0],
      [0, 0, 1, 1]
    ]
  end
  let(:right_way) do
    [
      [1, 1, 1, 0],
      [0, 0, 1, 0],
      [0, 0, 1, 0],
      [0, 0, 1, 1]
    ]
  end

  subject { PathFinder.new(example) }

  it 'should be true' do
    subject.find_way
    subject.terrain.should eq right_way
  end
end

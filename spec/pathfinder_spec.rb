require_relative '../pathfinder'

RSpec.describe PathFinder do
  let(:example) {[
                  [1, 1, 1, 0],
                  [1, 0, 1, 0],
                  [1, 0, 1, 0],
                  [0, 0, 1, 1]
                ]}
  let(:right_way) {[
                  [1, 1, 1, 0],
                  [0, 0, 1, 0],
                  [0, 0, 1, 0],
                  [0, 0, 1, 1]
                ]}

  subject { PathFinder.new(example) }

  it "should be true" do
    subject.find_way
    subject.terrain.should eq right_way
  end
end
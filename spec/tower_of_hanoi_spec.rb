require_relative '../tower_of_hanoi'

RSpec.describe 'hanoi_move' do
  let(:a) { [3, 2, 1] }
  let(:b) { [] }
  let(:c) { [] }

  subject { hanoi_move(3, a, c, b) }

  it 'should be true' do
    subject
    a.should eq b
    c.should eq [3, 2, 1]
  end
end

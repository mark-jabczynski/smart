require './visit'
require './stats/most_views'

describe Stats::MostViews do
  subject { described_class.new(data, number_of_tops).call }

  let(:number_of_tops) { 2 }
  let(:data) do
    [
      Visit.new(page: 'first page', ip: 'first user'),
      Visit.new(page: 'second page', ip: 'first user'),
      Visit.new(page: 'first page', ip: 'second user'),
      Visit.new(page: 'third page', ip: 'first user'),
      Visit.new(page: 'third page', ip: 'first user'),
      Visit.new(page: 'first page', ip: 'third user'),
    ]
  end

  it 'returns top 2 most viewed pages' do
    expect(subject).to eq([["first page", 3], ["third page", 2]])
  end
end

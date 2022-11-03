require './stats/most_unique_views'

describe Stats::MostUniqueViews do
  subject { described_class.new(data, number_of_tops).call }

  let(:number_of_tops) { 2 }
  let(:data) do
    [
      Visit.new(page: 'first page', ip: 'first user'),
      Visit.new(page: 'second page', ip: 'first user'),
      Visit.new(page: 'first page', ip: 'second user'),
      Visit.new(page: 'third page', ip: 'first user'),
      Visit.new(page: 'third page', ip: 'second user'),
      Visit.new(page: 'third page', ip: 'third user'),
      Visit.new(page: 'first page', ip: 'second user'),
    ]
  end

  it 'returns top 2 most uniquely viewed pages' do
    expect(subject).to match([["third page", 3], ["first page", 2]])
  end
end

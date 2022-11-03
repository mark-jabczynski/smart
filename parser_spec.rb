require './parser'

describe Parser do
  subject { described_class.new(path: path, operation: operation).call }

  let(:path) { 'fixtures/test.log' }
  let(:operation) { 'most_views' }

  it 'creates a file with the outcomes' do
    expect(subject).to eq <<~TEXT
      /contact 2 visits
      /help_page/1 1 visits
    TEXT
  end

  context 'when there is no file' do
    let(:path) { 'fake path' }

    it { expect { subject }.to raise_error(Errno::ENOENT) }
  end

  context 'when there is no operation passed' do
    let(:operation) { nil }

    it { expect { subject }.to raise_error(NoMethodError) }
  end

  context 'when there is fake operation passed' do
    let(:operation) { 'fake operation' }

    it { expect { subject }.to raise_error(NoMethodError) }
  end
end
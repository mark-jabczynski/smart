require './reader'

describe Reader do
  subject { described_class.new(path).call }

  let(:path) { 'fixtures/test.log'}

  it 'initializes the visits' do
    expect(subject).to match_array [
      have_attributes(class: Visit, page: '/help_page/1', ip: '126.318.035.038'),
      have_attributes(class: Visit, page: '/contact', ip: '184.123.665.067'),
      have_attributes(class: Visit, page: '/contact', ip: '184.123.665.068')
    ]
  end

  context 'when there is no file' do
    let(:path) { 'fake path'  }

    it { expect { subject }.to raise_error(Errno::ENOENT) }
  end
end

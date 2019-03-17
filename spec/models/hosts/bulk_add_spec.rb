describe Hosts::BulkAdd do
  context 'when save is successful' do
    subject { described_class.new(host_names: "test1\r\ntest2\r\n") }

    it 'creates multiple records' do
      expect { subject.save }.to change(Host, :count).by(2)
    end

    it 'finds already existing host with same name' do
      create(:host, name: 'test1')

      expect { subject.save }.to change(Host, :count).by(1)
    end
  end

  context 'when save fails' do
    context 'when there is a bad host name' do
      let(:bad_name) { 'ba d1' }
      subject { described_class.new(host_names: "abctest\r\ntest1\r\n#{bad_name}\r\ntest2\r\n") }

      it 'has spaces in one of the names' do
        expect do
          expect(subject.save).to be_falsey
        end.to change(Host, :count).by(0)
      end

      it 'adds validation errors' do
        expect(subject.save).to be_falsey

        expect(subject.errors[:host_names]).to eq ["#{bad_name}: Validation failed: Name No spaces allowed"]
      end
    end

    it 'has no host names' do
      subject = described_class.new

      expect(subject.save).to be_falsey
    end
  end
end
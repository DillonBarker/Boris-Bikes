require 'bike'

describe Bike do

  describe ' #reported_broken' do
    it 'can report bike as broken' do
      subject.report_broken
      expect(subject).to be_broken
    end
  end
end

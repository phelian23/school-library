require_relative '../corrector'

describe Corrector do
  context 'Testing the Corrector class' do
    it 'it should capitalize the name and correct the length' do
      corrector = Corrector.new
      corrected_name = corrector.correct_name('oluwanifemi')
      expect(corrected_name).match?(/\A[A-Z]/).to be true
      expect(corrected_name.length).to be_between(1, 10).inclusive
    end
  end
end

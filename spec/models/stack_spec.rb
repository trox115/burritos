require 'rails_helper'

RSpec.describe Stack, type: :model do
  context 'Validates if info obey to norms' do
    let(:stack) { build(:stack) }
    describe 'validates if burrito is valid' do
      it 'Burrito has all required fields, burrito is  Valid' do
        expect(stack).to be_valid
      end

      it 'Saves burrito on stack' do
        stack.save
        expect(stack).to be_valid
      end
    end
  end
end

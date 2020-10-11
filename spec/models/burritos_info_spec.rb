require 'rails_helper'

RSpec.describe BurritosInfo, type: :model do
  context 'Validates Burrito Info' do
    let(:burritos) { build(:burritos) }
    describe 'Validates presence of required fields' do
      it 'If no name burrito is not Valid' do
        burritos.name = nil
        expect(burritos).to_not be_valid
      end

      it 'If no address burrito is not Valid' do
        burritos.address = nil
        expect(burritos).to_not be_valid
      end

      it 'If no lat s is not Valid' do
        burritos.lat = nil
        expect(burritos).to_not be_valid
      end

      it 'If no lng burrito is not Valid' do
        burritos.lng = nil
        expect(burritos).to_not be_valid
      end

      it 'If no category burrito is not Valid' do
        burritos.category_id = nil
        expect(burritos).to_not be_valid
      end
    end
    describe 'Validates presence of required fields part 2' do
      it 'If no lat category2 is not Valid' do
        burritos.category_id2 = nil
        expect(burritos).to_not be_valid
      end

      it 'If no closed burrito is not Valid' do
        burritos.closed = nil
        expect(burritos).to_not be_valid
      end

      it 'If no lat burrito is not Valid' do
        burritos.lat = nil
        expect(burritos).to_not be_valid
      end
    end
    describe 'validates if required atributes obey the norms' do
      it 'Burrito has all required fields, burrito is  Valid' do
        expect(burritos).to be_valid
      end

      it 'Burrito category_id bellow 1000' do
        burritos.category_id = 999
        expect(burritos).to_not be_valid
      end

      it 'Burrito category_id above 1200' do
        burritos.category_id = 1201
        expect(burritos).to_not be_valid
      end

      it 'Burrito category_id2 bellow 2000' do
        burritos.category_id2 = 1999
        expect(burritos).to_not be_valid
      end

      it 'Burrito category_id2 above 2000' do
        burritos.category_id2 = 2201
        expect(burritos).to_not be_valid
      end
    end
  end
end

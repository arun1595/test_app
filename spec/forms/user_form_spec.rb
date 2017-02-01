require 'rails_helper'

describe UserForm, type: :model do
  describe 'validations' do

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:zip_code) }

    describe 'passwords match' do
      subject do
        UserForm.new(FactoryGirl.attributes_for(:user,
                                                password: 'password',
                                                password_confirmation: 'pass'))
      end
      it { is_expected.not_to be_valid }
    end
  end

  describe '#save' do
    context 'valid user creation' do
      let(:user) { UserForm.new(FactoryGirl.attributes_for(:user)) }

      it 'returns true' do
        expect(user.save).to be true
      end
    end

    context 'invalid user creation' do
      let(:invalid_user) { UserForm.new(FactoryGirl.attributes_for(:invalid_user)) }

      it 'returns false' do
        expect(invalid_user.save).to be false
      end
    end
  end
end
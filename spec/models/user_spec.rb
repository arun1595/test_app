require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:first_name) }
  it { is_expected.to respond_to(:last_name) }
  it { is_expected.to respond_to(:password) }
  it { is_expected.to respond_to(:street) }
  it { is_expected.to respond_to(:country) }
  it { is_expected.to respond_to(:zip_code) }

  describe 'validations' do
    subject { FactoryGirl.build(:user, email: 'john@gmail.com') }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:zip_code) }

    it { is_expected.to be_valid }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end
end

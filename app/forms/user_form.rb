class UserForm
  include ActiveModel::Model

  attr_accessor :email, :first_name, :last_name, :password, :password_confirmation,
                :street, :country, :zip_code

  # validations
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validate :passwords_match
  validates :first_name, presence: true
  validates :street, presence: true
  validates :country, presence: true
  validates :zip_code, presence: true

  def initialize(args={})
    args.each do |key, value|
      instance_variable_set("@#{key}", value) unless value.nil?
    end
  end

  def save
    return false unless valid?
    create_user
    true
  end

  def passwords_match
    if password != password_confirmation
      errors.add(:password_confirmation, 'doesn\'t match Password')
    end
  end

  private

  def create_user
    User.create!(user_attributes)
  rescue ActiveRecord::RecordInvalid
    errors.add(:email, 'has been already taken')
  end

  def user_attributes
    {
      email: email,
      first_name: first_name,
      last_name: last_name,
      password: password,
      password_confirmation: password_confirmation,
      street: street,
      country: country,
      zip_code: zip_code
    }
  end
end
require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:user_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:encrypted_password) }
  it { should validate_presence_of(:full_name }
  it { should validate_presence_of(:phone_number}
  it { should validate_presence_of(:address}
end

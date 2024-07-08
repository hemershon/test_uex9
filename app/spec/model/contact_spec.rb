require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "is valid with valid attributes" do
    user = User.create(email: 'test@example.com', password: 'password')
    contact = Contact.new(name: 'John Doe', cpf: '12345678909', phone: '1234567890', address: 'Street 123', user: user)
    expect(contact).to be_valid
  end

  it "is not valid without a name" do
    contact = Contact.new(name: nil)
    expect(contact).to_not be_valid
  end
end

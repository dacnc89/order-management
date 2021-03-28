require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#full_name' do
    it 'should return the combine string of first name and last name' do
      first_name = "John"
      last_name = "Test"
      full_name = first_name + ' ' + last_name
      user = User.new(first_name: first_name, last_name: last_name)
      expect(user.full_name).to eq full_name
    end
  end
end

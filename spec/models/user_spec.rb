require 'rails_helper'

# Previous content of test helper now starts here
# RSpec.describe User, type: :model do
#   context 'validate for username' do
#     it 'should be present' do
#       user = FactoryBot.build(:user, username: '')
#       expect(user.save).to eq(false)
#     end
#   end
# end

RSpec.describe User, type: :model do
  context 'validate for username' do
    it 'should be present' do
      user = User.new
      user.email = 'newemail@gmail.com'
      expect(user.validate).to eq(false)
      user.first_name = 'newemail@gmail.com'
      expect(user.validate).to eq(false)
    end
  end
end
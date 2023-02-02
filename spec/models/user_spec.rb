require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    it 'must have a username' do
      user = FactoryBot.build(:user, username: nil)
      expect(user.valid?).to eq(false)
    end
    it 'dont must to have first or last name' do
      user = FactoryBot.build(:user, first_name: nil, last_name: nil)
      expect(user.valid?).to eq(true)
    end
    it 'must have password == password_confirmation' do
      user = FactoryBot.build(:user, password: 'password', password_confirmation: 'password1')
      expect(user.valid?).to eq(false)
    end
    it 'must have a username+@gmail.com' do
      user = FactoryBot.build(:user)
      expect(user.email.include?(user.username)).to eq(true)
    end
    it 'should not has same username' do
      user1 = FactoryBot.create(:user, username: 'samename')
      user2 = FactoryBot.build(:user, username: 'samename')
      expect(user2.valid?).to eq(false)
    end
  end

  describe 'Scope' do
    before do
      FactoryBot.create_list(:user, 30)
    end
    it 'all role == author' do
      expect(User.authors.first.role).to eq('author')
    end
    it 'all role == basic' do
      expect(User.basics.pluck(:role).include?('basic')).to eq(true)
    end
    it 'all role == singer' do
      expect(User.singers.pluck(:role).include?('singer')).to eq(true)
    end
  end

  describe 'instance methods' do
    it 'user is not ADMIN' do
      user = FactoryBot.build(:user)
      expect(user.admin?).to eq(false)
    end
  end

  describe 'Association' do
    def association(kw)
      described_class.reflect_on_association(kw).macro
    end
    it 'has_many :articles' do
      expect(association(:articles)).to eq(:has_many)
    end
    it 'has_many :comments' do
      expect(association(:comments)).to eq(:has_many)
    end
    it 'has_many :rates' do
      expect(association(:rates)).to eq(:has_many)
    end
  end
end

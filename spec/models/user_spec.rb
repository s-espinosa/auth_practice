require 'rails_helper'

describe User do
  describe '#role' do
    it 'can return admin' do
      user = User.create(name: 'Sal',
                         email: 'sal@sal.com',
                         password: 'pass',
                         password_confirmation: 'pass',
                         role: 1
                        )

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end

    it 'can return default' do
      user = User.create(name: 'Penelope',
                         email: 'pen@pen.com',
                         password: 'pass',
                         password_confirmation: 'pass'
                        )

      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end
  end
end

class User < ApplicationRecord
    has_many :tokens
    validates :email, presence: true, email: true
    validates :uid, :provider, presence: true
    
    def self.from_omniauth(data)
        # Recibir has de datos
        # { provider: 'google', uid: '123456', info: { name: 'Ruben Rodriguez', email: 'example@email.com'} }
        #

        User.where(uid: data[:uid], provider: data[:provider]).first_or_create do |user|
            user.email = data[:info][:email]
        end
    end
end

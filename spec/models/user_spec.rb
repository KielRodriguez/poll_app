require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should_not allow_value("uriel@codigofacilito").for(:email) }
  it { should allow_value("uriel@codigofacilito.com").for(:email) }
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:provider) }

  it "should create a new user if uid and provider not exist" do
    expect {
      User.from_omniauth({uid: 'nuevouid12345', provider: 'facebook', info: { email: 'example@email.com', name: 'Ruben Rodriguez Rodriguez' } })
    }.to change(User, :count).by(1)
  end

  it "should find a user if uid and provider exist" do
    user = create(:user)
    expect {
      User.from_omniauth({uid: user.uid, provider: user.provider, info: { email: user.email, name: user.name } })
    }.to change(User, :count).by(0)
  end

  it "deberia retornar el usuario encontrado si el uid y provider existen" do
    user = create(:user)
    expect(
      User.from_omniauth({uid: user.uid, provider: user.provider })
    ).to eq(user)
  end
end

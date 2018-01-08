FactoryBot.define do
  factory :poll do
    association :user, factory: :user
    expires_at "2018-01-04 01:54:09"
    title "My Titulo de 10 caracteres"
    description "Descripcion con mucho texto para saltar validacion de 20 caracteres"
  end
end

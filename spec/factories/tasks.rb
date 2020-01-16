FactoryBot.define do
  factory :task do
    task { "MyText" }
    id_phase { 1 }
    user_email { "MyString" }
  end
end

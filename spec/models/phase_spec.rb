require 'rails_helper'

RSpec.describe Phase, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "- Validade da classe Phase -" do
    it "New Válido?" do
      board_aux = Phase.new

      expect(board_aux.class == Phase).to be_truthy
    end
    it "New Invalido?" do
      board_aux = Phase.new

      expect(board_aux.class != Phase).to be_falsey
    end
  end

  context "- Validade do atributo name -" do
    it "name Válido?" do
      100.times {
        Faker::Config.random = Random.new(100)
        number_aux1 = Faker::Config.random.seed
        Faker::Config.random = Random.new(number_aux1.to_s.size)
        number_aux2 = Faker::Config.random.seed
        Faker::Config.random = Random.new(number_aux1.to_s.size - number_aux2.to_s.size)
        number_aux3 = Faker::Config.random.seed
        Faker::Config.random = nil
        string_aux = Faker::Alphanumeric.alphanumeric(number: number_aux1, min_alpha: number_aux2, min_numeric: number_aux3)

        phase_aux = Phase.new(name: :string_aux)
        expect(phase_aux.name.class == String).to be_truthy
      }
    end
    it "name Invalido?" do
      100.times {
        Faker::Config.random = Random.new(100)
        number_aux1 = Faker::Config.random.seed
        Faker::Config.random = Random.new(number_aux1.to_s.size)
        number_aux2 = Faker::Config.random.seed
        Faker::Config.random = Random.new(number_aux1.to_s.size - number_aux2.to_s.size)
        number_aux3 = Faker::Config.random.seed
        Faker::Config.random = nil
        string_aux = Faker::Alphanumeric.alphanumeric(number: number_aux1, min_alpha: number_aux2, min_numeric: number_aux3)

        phase_aux = Phase.new(name: :string_aux)
        expect(phase_aux.name.class != String).to be_falsey
      }
    end
  end

  #FactoryBot.define do
  #  factory :phase do
  #    sequence :nhl_id
  #    name { Faker::Name.name }
  #  end
  #end
end

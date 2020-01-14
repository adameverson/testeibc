require 'rails_helper'

RSpec.describe Task, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "- Validade da classe Task -" do
    it "New Válido?" do
      board_aux = Task.new

      expect(board_aux.class == Task).to be_truthy
    end
    it "New Invalido?" do
      board_aux = Task.new

      expect(board_aux.class != Task).to be_falsey
    end
  end

  #FactoryBot.define do
  #  factory :task do
  #    sequence :nhl_id
  #    name { Faker::Name.name }
  #  end
  #end
end

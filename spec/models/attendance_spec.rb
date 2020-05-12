# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  before do
    # en général, tu as envie de créer une nouvelle instance
    @attendance = FactoryBot.create(:attendance)
  end

  context "validations" do
    it "is valid with valid attributes" do
      # création qui est valide
      expect(@attendance).to be_a(Attendance)
      expect(@attendance).to be_valid
    end

    describe "stripe_customer_id" do
      # teste cet attribut, en fonction de la validation que tu lui as donnée
      it 'is not valid without stripe_customer_id' do
        bad_attendace = Attendance.create(user_id: FactoryBot.create(:user).id, event_id: FactoryBot.create(:event).id)
        expect(bad_attendace).not_to be_valid
        expect(bad_attendace.errors.include?(:stripe_customer_id)).to eq(true)
      end
    end
  end

  context "associations" do
    describe "some association" do
      # teste cette association
      it 'has an user' do
        user = FactoryBot.create(:user)
      end

      it 'has an event' do
        user = FactoryBot.create(:event)
      end
    end
  end

  context "callbacks" do
    describe "some callbacks" do
      # teste ce callback
    end
  end

  context "public instance methods" do
    describe "Should return :" do
      # teste cette méthode
      it 'returns string' do
        expect(@attendance.stripe_customer_id).to be_a(String)
      end
    end
  end

  context "public class methods" do
    describe "self.some_method" do
      # teste cette méthode
    end
  end
end

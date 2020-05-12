# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    # en général, tu as envie de créer une nouvelle instance
    @user = FactoryBot.create(:user)
  end

  context "validations" do
    it "is valid with valid attributes" do
      # création qui est valide
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    describe "#some_attribute" do
      # teste cet attribut, en fonction de la validation que tu lui as donnée
    end
  end

  context "associations" do
    describe "events / attendance" do
      # teste cette association
      it 'has many events' do
        event = FactoryBot.create(:event)
        expect(@user.events.include?(event)).to eq(false)
      end

      it 'has many attendance' do
        attendance = FactoryBot.create(:attendance)
        expect(@user.attendances.include?(attendance)).to eq(false)
      end
    end
  end

  context "callbacks" do
    describe "some callbacks" do
      # teste ce callback
    end
  end

  context "public instance methods" do
    describe "should return :" do
      # teste cette méthode
      it 'string' do
        expect(@user.first_name).to be_a(String)
        expect(@user.last_name).to be_a(String)
        expect(@user.email).to be_a(String)
      end
    end
  end

  context "public class methods" do
    describe "self.some_method" do
      # teste cette méthode
    end
  end
end

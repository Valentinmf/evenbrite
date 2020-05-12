# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    # en général, tu as envie de créer une nouvelle instance
    @event = FactoryBot.create(:event)
  end

  context "validations" do
    it "is valid with valid attributes" do
      # création qui est valide
      expect(@event).to be_a(Event)
      expect(@event).to be_valid
    end

    describe 'description' do
      # teste cet attribut, en fonction de la validation que tu lui as donnée
      it 'is not valid without description' do
        bad_event = Event.create(user_id: FactoryBot.create(:user).id, title: 'Hello_world', start_date: DateTime.new.to_f(3001, 2, 3, 4, 5, 6), price: rand(1..56), location: 'Paris', duration: 60)
        expect(bad_event).not_to be_valid
        expect(bad_event.errors.include?(:description)).to eq(true)
      end

      it 'is not valid without description length < 20' do
        bad_event = Event.create(user_id: FactoryBot.create(:user).id, title: 'Hello_world', start_date: DateTime.new(3001, 2, 3, 4, 5, 6), price: rand(1..56), location: 'Paris', duration: 60, description: 'Hel')
        expect(bad_event).not_to be_valid
        expect(bad_event.errors.include?(:description)).to eq(true)
      end
    end

    describe 'title' do
      it 'is not valid without title' do
        bad_event = Event.create(user_id: FactoryBot.create(:user).id, start_date: DateTime.new(3001, 2, 3, 4, 5, 6), price: rand(1..56), location: 'Paris', duration: 60, description: 'Hel')
        expect(bad_event).not_to be_valid
        expect(bad_event.errors.include?(:title)).to eq(true)
      end

      it 'is not valid without title length < 5' do
        bad_event = Event.create(user_id: FactoryBot.create(:user).id, title: 'H', start_date: DateTime.new(3001, 2, 3, 4, 5, 6), price: rand(1..56), location: 'Paris', duration: 60, description: 'Hel')
        expect(bad_event).not_to be_valid
        expect(bad_event.errors.include?(:title)).to eq(true)
      end
    end

    describe 'price' do
      it 'is not valid without price' do
        bad_event = Event.create(user_id: FactoryBot.create(:user).id, title: 'Hello_world', start_date: DateTime.new(3001, 2, 3, 4, 5, 6), location: 'Paris', duration: 60, description: 'Hel')
        expect(bad_event).not_to be_valid
        expect(bad_event.errors.include?(:price)).to eq(true)
      end
    end

    describe 'location' do
      it 'is not valid without location' do
        bad_event = Event.create(user_id: FactoryBot.create(:user).id, title: 'Hello', start_date: DateTime.new(3001, 2, 3, 4, 5, 6), price: rand(1..56), duration: 60, description: 'Hel')
        expect(bad_event).not_to be_valid
        expect(bad_event.errors.include?(:location)).to eq(true)
      end
    end
  end

  context "associations" do
    describe "some association" do
      # teste cette association
      it 'has an user' do
        user = FactoryBot.create(:user)
        expect(@event.users.include?(user)).to eq(false)
      end

      it 'has many attendances' do
        attendance = FactoryBot.create(:attendance)
        expect(@event.attendances.include?(attendance)).to eq(false)
      end
    end
  end

  context "callbacks" do
    describe "some callbacks" do
      # teste ce callback
    end
  end

  context "public instance methods" do
    describe "Class of entries" do
      # teste cette méthode
      it 'is string' do
        expect(@event.title).to be_a(String)
        expect(@event.title).to be_a(String)
      end

      it 'is integer' do
        expect(@event.duration).to be_a(Integer)
        expect(@event.price).to be_a(Integer)
      end
    end
  end

  context "public class methods" do
    describe "self.some_method" do
      # teste cette méthode
    end
  end
end

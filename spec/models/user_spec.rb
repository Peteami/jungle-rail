require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "Validate if password_confirmation is the same as password good" do
      @user = User.new(email:"TEST@TEST.COM", first_name:"Good", last_name:"Test", password:"gpass", password_confirmation:"gpass")
      expect(@user).to be_valide
    end

    it "Validate if password_confirmation is the same as password bad" do
      @user = User.new(email:"TEST@TEST.COM", first_name:"Good", last_name:"Test", password:"gpass", password_confirmation:"pass")
      expect(@user).to_not be_valide
    end

    it "Validate emails must be unique" do
      @user = User.new(email:"TEST@TEST.COM", first_name:"Good", last_name:"Test", password:"gpass", password_confirmation:"gpass")
      @user.save
      @user2 = User.new(email:"test@test.com", first_name:"Bad", last_name:"Test", password:"bpass", password_confirmation:"bpass")
      expect(@user2).to_not be_valide
    end

    it "Validate email should also be required" do
      @user = User.new(email:"", first_name:"Good", last_name:"Test", password:"gpass", password_confirmation:"gpass")
      @user.save
      expect(@user).to_not be_valide
    end

    it "Validate first name should also be required" do
      @user = User.new(email:"TEST@TEST.COM", first_name:"", last_name:"Test", password:"gpass", password_confirmation:"gpass")
      @user.save
      expect(@user).to_not be_valide
    end

    it "Validate last name should also be required" do
      @user = User.new(email:"TEST@TEST.COM", first_name:"Good", last_name:"", password:"gpass", password_confirmation:"gpass")
      @user.save
      expect(@user).to_not be_valide
    end

    it "Validate that the password is a minimum length of 5" do
      @user = User.new(email:"pierre@dinelle.com", first_name:"Pierre", last_name:"Dinelle", password:"pass", password_confirmation:"pass")
      @user.save
      expect(@user).to_not be_valide
    end


  end

  describe '.authenticate_with_credentials' do

    it "Validate price" do
      @user = user.new(email:"pierre@dinelle.com", first_name:"Pierre", last_name:"Dinelle", password:"gpass", password_confirmation:"gpass")
      @user.save
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to be_a User
    end

  end
end



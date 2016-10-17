require 'rails_helper'

RSpec.describe User, type: :model do

  context '.authenticate_with_credentials' do
    before :each do
      @user = User.create(
        firstname: "Rachel",
        lastname: "Green",
        email: "SS@rg.com",
        password: "1234",
        password_confirmation: "1234"
      )
    end

    it "validates when user successfully logs in" do
      @user = User.authenticate_with_credentials("SS@rg.com", "1234")
      expect(@user).to be_instance_of(User)
    end

    it "validates when user uses incorrect email to log in" do
      @user = User.authenticate_with_credentials("SSS@rg.com", "1234")
      expect(@user).not_to be_instance_of(User)
    end

    it "validates when user uses incorrect password to log in" do
      @user = User.authenticate_with_credentials("SS@rg.com", "12345")
      expect(@user).not_to be_instance_of(User)
    end

    it "validates when user puts extra spaces in email" do
      @user = User.authenticate_with_credentials("  SS@rg.com", "1234")
      expect(@user).to be_instance_of(User)
    end

    it "validates when user types different uppercase/lowercase with email" do
      @user = User.authenticate_with_credentials("Ss@rG.cOm", "1234")
      expect(@user).to be_instance_of(User)
    end

  end

  context "Validations" do
    before :each do
      @user = User.create(
        firstname: "Rachel",
        lastname: "Green",
        email: "SS@rg.com",
        password: "1234",
        password_confirmation: "1234"
      )
    end

    it "validates if it is a good user" do
      expect(@user).to be_valid
    end

    it "validates when user does not have a first name" do
      @user[:firstname] = nil
      expect(@user).not_to be_valid
    end

    it "validates when user does not have a last name" do
      @user[:lastname] = nil
      expect(@user).not_to be_valid
    end

    it "validates when user does not have a email" do
      @user[:email] = nil
      expect(@user).not_to be_valid
    end

    it "validates when user does not have a password" do
      @user = User.create(
        firstname: "R",
        lastname: "G",
        email: "SSmm@rg.com",
        password_confirmation: "1234"
      )
      expect(@user).not_to be_valid

    end

    it "validates when user does not have a password_confirmation" do
      @user = User.create(
        firstname: "R",
        lastname: "G",
        email: "SSmm@rg.com",
        password: "1234"
      )
      expect(@user).not_to be_valid
    end

    it "validates email uniqueness" do
      @user2 = User.create(
        firstname: "Lip",
        lastname: "Sticks",
        email: @user[:email],
        password: "123",
        password_confirmation: "123"
      )
      expect(@user2).not_to be_valid
      expect(@user2.errors[:email]).to eq(["has already been taken"])
    end

    it "validates email case insensitivity" do
      @user2 = User.create(
        firstname: "Lip",
        lastname: "Sticks",
        email: @user[:email].downcase,
        password: "123",
        password_confirmation: "123"
      )
      expect(@user2).not_to be_valid
      expect(@user2.errors[:email]).to eq(["has already been taken"])
    end

    it "validates password length to be equal or greater than 4" do
      @user = User.create(
        firstname: "R",
        lastname: "G",
        email: "SSmm@rg.com",
        password: "1234",
        password_confirmation: "1234"
      )
      expect(@user).to be_valid
    end

    it "validates when password length is smaller than 4" do
      @user2 = User.create(
        firstname: "R",
        lastname: "G",
        email: "SSmm@rg.com",
        password: "123",
        password_confirmation: "123"
      )
      expect(@user2).not_to be_valid
      expect(@user2.errors[:password]).to eq(["is too short (minimum is 4 characters)"])
    end

  end

end

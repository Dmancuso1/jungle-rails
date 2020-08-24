require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it "has unique email" do
      test_user= User.create(
        name: "Charles",
        email: "example@example.com",
        password: "word")
      expect(User.find_by_email(test_user.email)).to be_truthy
    end

    it "password has min length of 6 chars" do
      test_user= User.create(
        name: "Charles",
        email: "example@example.com",
        password: "word")
      expect(test_user).to_not be_valid
    end
    
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here

    it "should remove leading/trailing white space" do
      test_user= User.create(
        name: "Charles",
        email: "example@example.com",
        password: "testpassword")
      expect(User.authenticate_with_credentials(" example@example.com ", test_user.password)).to be_truthy
    end

    it "should find email regardless of case" do
      test_user= User.create(
        name: "Charles",
        email: "examplE@example.com",
        password: "testpassword")
      expect(User.authenticate_with_credentials("examplE@example.COM", test_user.password)).to be_truthy
    end

  end


end


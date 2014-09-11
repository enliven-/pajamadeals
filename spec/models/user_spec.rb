require "spec_helper"

describe User do

  it "should have email, mobile" do
    user = User.new
    expect(user).to respond_to(:email)
    expect(user).to respond_to(:mobile)
  end

  it "has valid factories" do
    user = build :user
    expect(user).to be_valid
    expect(user.save).to be_truthy
  end

  it "should have token" do
    user = create :user
    expect(user.token).to be_present
  end

  it "should have a valid college" do
    user = create :user
    expect(user.college).to be_present
  end
  
  context "user roles" do
    it "should be able to create user with user role" do
      user = create :user
      expect(user.role).to eql("user")
    end
  
    it "should create user with admin role" do 
      admin = create :admin
      expect(admin.admin?).to be_truthy
    end
    
    it "should create user with ambassador role" do
      user = create :ambassador
      expect(user.role).to eql("ambassador")
    end
  end
  
  it 'is guest if not logged in via facebook' do
    user = create :user, uid: nil
    expect(user).to be_guest
  end
end
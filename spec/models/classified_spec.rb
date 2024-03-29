require 'spec_helper'

describe Classified do

  it 'responds to title, description, price, category, college, user, buy?, 
      sell?, image' do
    classified = Classified.new
    expect(classified).to respond_to(:title)
    expect(classified).to respond_to(:description)
    expect(classified).to respond_to(:price)
    expect(classified).to respond_to(:image)
    expect(classified).to respond_to(:buy?)
    expect(classified).to respond_to(:sell?)
    expect(classified).to respond_to(:category)
    expect(classified).to respond_to(:college)
    expect(classified).to respond_to(:user)
  end

  it 'has valid factories' do
    classified = create :classified
    expect(Classified.all).to include(classified)
  end

  it 'should have token' do
    classified = create :classified
    expect(classified.token).to be_present
  end

  it 'is invalid without a title' do
    classified = build :classified, title: nil
    expect(classified).not_to be_valid
  end

  it 'is invalid without a price' do
    classified = build :classified, price: nil
    expect(classified).not_to be_valid
  end

  it 'is invalid with aplhanumeric price' do
    classified = build :classified, price: 'abc123'
    expect(classified).not_to be_valid
  end

  it 'should have a valid college' do
    classified = create :classified
    expect(classified.college).to be_present
    expect(classified.college).to be(classified.user.college)
  end
  
  it 'creates sell classifieds' do
    classified = create :sell_classified
    expect(classified.sell?).to be_truthy
    expect(classified.buy?).to be_falsy
    expect(Classified.sell).to include(classified)
    expect(Classified.buy).not_to include(classified)
  end
  
  it 'creates buy classifieds' do
    classified = create :buy_classified
    expect(classified.buy?).to be_truthy
    expect(classified.sell?).to be_falsy
    expect(Classified.buy).to include(classified)
    expect(Classified.sell).not_to include(classified)
  end
  
  it 'has the right owner' do
    user1 = create :user
    user2 = create :user, mobile: '9999999898'
    classified = create :classified, user: user1
    
    expect(classified.owner).to be user1
    expect(classified.owner?(user1)).to be_truthy
    expect(classified.owner?(user2)).to be_falsy
  end
  
  it "marks record deleted on delete!" do
    classified = create :classified
    
    expect(classified.deleted?).to be_falsy
    
    classified.delete!
    
    expect(classified.deleted?).to be_truthy
  end
end

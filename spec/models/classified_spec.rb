require 'spec_helper'

describe Classified do

  it 'should have title, description, price, category, college, user attributes' do
    classified = Classified.new
    expect(classified).to respond_to(:title)
    expect(classified).to respond_to(:description)
    expect(classified).to respond_to(:price)
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
end

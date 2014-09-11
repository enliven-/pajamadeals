require 'spec_helper'

describe Category do
  
  it 'should have name' do
    category = Category.new
    expect(category).to respond_to(:name)
  end
  
  it 'has valid factories' do
    category = build :category
    expect(category).to be_valid
    expect(category.save).to be_truthy
    
    category = build :books
    expect(category).to be_valid
    expect(category.save).to be_truthy
    
    category = build :mobiles
    expect(category).to be_valid
    expect(category.save).to be_truthy
    
    category = build :projects
    expect(category).to be_valid
    expect(category.save).to be_truthy
  end
  
  it 'has many classifieds' do
    category = build :category
    expect(category).to respond_to :classifieds
  end
end
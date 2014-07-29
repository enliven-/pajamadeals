require 'spec_helper'


describe College do

  it 'has valid factories' do
    college = create :college
    expect(College.all).to include(college)

    vit = create :vit
    expect(College.all).to include(vit)

    viit = create :viit
    expect(College.all).to include(viit)
  end

  it 'should have token' do
    college = create :college
    expect(college.token).to be_present
  end

end

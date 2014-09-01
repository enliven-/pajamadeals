require 'spec_helper'


describe College do

  it 'has valid factories' do
    college = create :college
    expect(College.all).to include(college)

    vit = create :vit
    expect(College.all).to include(vit)

    viit = create :viit
    expect(College.all).to include(viit)
    
    mit = create :mit
    expect(College.all).to include(mit)
  end

  it 'should have token' do
    college = create :college
    expect(college.token).to be_present
  end
  
  describe 'geo location' do
    it 'should search for colleges within 5km radius' do
      vit  = create :vit
      viit = create :viit
      mit  = create :mit
      College.reindex
      
      results = College.search('*', where: {location: 
                          {near: [vit.latitude, vit.longitude], within: "5km"}})                                              
      results = results.results
      
      expect(results).to include(vit)
      expect(results).to include(viit)
      expect(results).not_to include(mit)
    end
  end
end

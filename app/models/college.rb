class College < ActiveRecord::Base
  default_scope { where(active: true) }

  has_many :users
  has_many :classifieds

  include HasToken
  has_token

  def name_with_abbr_and_city
    "#{name} (#{abbr}), #{city}"
  end
  
  # location
  
  searchkick locations: ["location"]
  def search_data
    attributes.merge location: [latitude, longitude]
  end
end

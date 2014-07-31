class College < ActiveRecord::Base

  include HasToken

  has_many :users
  has_many :classifieds

  has_token

  def name_with_abbr_and_city
    "#{name} (#{abbr}), #{city}"
  end
end

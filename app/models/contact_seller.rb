class ContactSeller < ActiveRecord::Base

  belongs_to :classified
  
  alias_attribute :phone, :mobile_number
  alias_attribute :phone_number, :mobile_number
end

ActiveAdmin.register College do
  permit_params :name, :abbr, :zipcode, :city, :latitude, :longitude, :active

end

json.array!(@classifieds) do |classified|
  json.extract! classified, :id, :title, :description, :image, :user_id, :college_id, :price, :type, :status
  json.url classified_url(classified, format: :json)
end

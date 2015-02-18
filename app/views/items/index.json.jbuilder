json.array!(@items) do |item|
  json.extract! item, :id, :list_id, :item_name, :item_description, :item_rating, :item_recommendation
  json.url item_url(item, format: :json)
end

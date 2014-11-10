json.array!(@charges) do |charge|
  json.extract! charge, :id, :amount, :unique_code, :paid, :refunded, :owner_type, :owner_id
  json.url charge_url(charge, format: :json)
end

json.array!(@users) do |user|
  json.id user.id
  json.name user.name
  json.total_points user.total_points
end

json.name @user.name
json.transactions @user.transactions do |transaction|
  json.summ transaction.sum
  json.date transaction.created_at.strftime("%F %T")
end

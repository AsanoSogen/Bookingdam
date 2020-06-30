# frozen_string_literal: true

json.array! @users do |user|
  json.nickname user.nickname
  json.email user.email
  json.phone_number user.address.phone_number
end

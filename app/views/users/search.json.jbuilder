# frozen_string_literal: true

json.array! @users do |user|
  json.id user.id
  json.nickname user.nickname
end

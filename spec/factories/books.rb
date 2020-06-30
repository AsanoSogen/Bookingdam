# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title              { 'もくもく会' }
    text               { 'もくもく会を開催します。気軽にご応募ください' }
    image              { 'car_clean_sagyouin.png' }
    published_at       { '2020-08-01' }
    end_day            { '2020-09-01' }
    address            { '愛知県女性総合センター' }
    latitude           { 35.1803 }
    longitude          { 136.786 }
  end
end

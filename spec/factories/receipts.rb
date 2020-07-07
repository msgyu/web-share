FactoryBot.define do
  factory :receipt do
    association :product
    name { product.name }
    price { product.price}
    seller_id { product.user}
    buyer_id
  end
end
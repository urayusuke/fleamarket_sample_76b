FactoryBot.define do
  factory :product do
    id                 {1}
    name               {"test"}
    content            {"testだよ"}
    price              {10000}
    seller_id          {1}
    category_id        {1}
    delively_cost_id   {1}
    product_status_id  {1}
    prefecture_id      {1}
    delively_days_id   {1}
    delively_method_id {1}
  end
end
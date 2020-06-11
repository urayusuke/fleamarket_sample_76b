FactoryBot.define do
  factory :credit do
    # number       {1234567890123456}
    # exp_month    {4}
    # exp_year     {22}
    # cvc          {343}
    user_id       {1}
    customer_id   {1}
    card_id       {1}
  end
end
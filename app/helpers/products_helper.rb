module ProductsHelper
  def tax_included_price(price)
    "#{(price*1.1).round.to_s(:delimited)}円"
  end
end

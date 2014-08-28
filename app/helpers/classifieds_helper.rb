module ClassifiedsHelper
  
  def render_price(price)
    price.to_i > 0 ? "Rs #{price}" : "Free"
  end
end

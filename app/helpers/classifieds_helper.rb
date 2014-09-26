module ClassifiedsHelper
  
  def render_price(price)
    price.to_i > 0 ? "Rs #{price}" : "Free"
  end
  
  def render_listing_type_label(classified)
		if classified.buy?
			'<div class="label label-success">Want</div>'.html_safe
		else
			'<div class="label label-info">Sell</div>'.html_safe
    end
  end
  
  def render_mark_text(classified)
    text = 'Mark as '
    case @classified.listing_type
    when "sell"
      text += 'sold'
    when "buy"
      text += 'bought'
    end
  end
  
end

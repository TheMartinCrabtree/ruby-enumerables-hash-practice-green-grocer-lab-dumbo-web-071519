def consolidate_cart(cart)
  final_cart = {}
  
  cart.each do |item|
    item.each do |name, price_info|
        if(final_cart[name].nil?)
          final_cart[name] = price_info.merge({:count => 1})
        else
          final_cart[name][count:]+=1 
        end
    end
  end
  
  return final_cart
end




def apply_coupons(cart, coupons)
  coupon_update = cart
  
  coupons.each do |coupon_info|
    item = coupon_info[:item]
    
    if (!coupon_update[item].nil? && coupon_update[item][:count] >= coupon_info[:num])
        temp = {"#{item} W/COUPON" => {
         :price => coupon_info[:cost],
          :clearance => coupon_update[item][:clearance],
          :count => 1
         }
        }
      
        if coupon_update["#{item} W/COUPON"].nil?
          coupon_update.merge!(temp)
        else
          coupon_update["#{item} W/COUPON"][:count] += 1
        end
        coupon_update[item][:count] -= coupon_info[:num]
      end
  end
  
  return coupon_update
end




def apply_clearance(cart)
  cart.each do |item, price_info|
    if price_info[:clearance] == true 
      price_info[:price] = (price_info[:price] * 0.8).round(2)
    end
  end
  
  return cart
end


def checkout(cart, coupons)
  # code here
end

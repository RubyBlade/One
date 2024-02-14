module CurrentCart

  private

    def set_cart
      @cart = Cart.find(session[:cart_id])
     # puts "This cart has #{@cart.line_items.count} line items" # Вывод кол-ва итемов в корзине
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
end

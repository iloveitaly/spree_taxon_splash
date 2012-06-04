Spree::OrdersController.class_eval do
	def bundle_populate
    @order = current_order(true)

    existing_variants = {}
    @order.line_items.each_with_index { |l, i| existing_variants[l.variant.id] = i }

    params[:variants].each do |variant_id, quantity|
      quantity = quantity.to_i
      variant_id = variant_id

      # update (not add) if already in cart
      if not existing_variants[variant_id].nil?
        if quantity > 0
          @order.line_items[existing_variants[variant_id]].quantity = quantity 
        else
          @order.line_items.delete_at(variant_id)
        end
      else
        @order.add_variant(Spree::Variant.find(variant_id), quantity) if quantity > 0
      end
    end if params[:variants]

    flash[:notice] = t(:added_to_cart)

    @order.save

    fire_event('spree.cart.add')
    fire_event('spree.order.contents_changed')

    unless request.env["HTTP_REFERER"].blank?
      redirect_to(request.env["HTTP_REFERER"] + '#bundle_list')
    else
      redirect_to(:back)
    end
	end
end

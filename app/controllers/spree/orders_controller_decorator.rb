Spree::OrdersController.class_eval do
  # UPGRADE_CHECK although bundle_populate is a custom method, it is closely related to #update and should checked during the upgrade process
  
  def bundle_populate
    @order = current_order(true)

    # TODO since we don't need the index anymore this could be cleaned up
    existing_variants = {}
    @order.line_items.each_with_index { |l, i| existing_variants[l.variant.id] = i }

    params[:variants].each do |variant_id, quantity|
      quantity = quantity.to_i
      variant_id = variant_id.to_i

      # update (not add) if already in cart
      if existing_variants[variant_id].nil?
        @order.add_variant(Spree::Variant.find(variant_id), quantity) if quantity > 0
      else
        @order.line_items[existing_variants[variant_id]].quantity = quantity 
      end
    end if params[:variants]

    @order.line_items = @order.line_items.select {|li| li.quantity > 0 }

    flash[:notice] = t(:added_to_cart)

    @order.save!

    fire_event('spree.cart.add')
    fire_event('spree.order.contents_changed')

    # TODO this is a bit messy, must be a way to clean it up. URL parsing?
    if params.has_key? :checkout or request.env["HTTP_REFERER"].blank?
      redirect_to cart_path
    else
      redirect_to request.env["HTTP_REFERER"] + (request.env["HTTP_REFERER"].end_with?('#bundle_list') ? '' : '#bundle_list')
    end
  end
end

Spree::TaxonsController.class_eval do
	# pattern grabbed from: http://stackoverflow.com/questions/4470108/

	old_show = instance_method(:show)

	define_method(:show) do
	   	@taxon = Spree::Taxon.find_by_permalink!(params[:id])

      if @taxon.taxon_splash.nil?
        old_show.bind(self).()
      else
        render :template => 'spree/taxons/splash'
      end
	end
end
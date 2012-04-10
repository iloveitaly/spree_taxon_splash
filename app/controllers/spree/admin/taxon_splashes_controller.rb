module Spree
	module Admin
		class TaxonSplashesController < ResourceController
			respond_to :html

			def index
				@splashes = Spree::TaxonSplash.all
			end

		end
	end
end

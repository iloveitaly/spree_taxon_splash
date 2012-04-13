module Spree
	class TaxonSplash < ActiveRecord::Base
		belongs_to :taxon, :autosave => true
		validates_presence_of :taxon
		
		def is_leaf?
			children.count == 0
		end

		def children
			begin
				taxon.children.select { |c| not c.taxon_splash.nil? }.map { |c| c.taxon_splash }
			rescue
				[]
			end
		end 

		def products
			# TODO: see if products are manually defined, if not fallback to taxon products
			taxon.products
		end
	end
end
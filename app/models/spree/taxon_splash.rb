module Spree
	class TaxonSplash < ActiveRecord::Base
		belongs_to :taxon

		def children
			begin
				taxon.children.select { |c| not c.taxon_splash.nil? }.map { |c| c.taxon_splash }
			rescue
				[]
			end
		end 

		def products
			[]
		end
	end
end
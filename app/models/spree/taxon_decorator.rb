Spree::Taxon.class_eval do
	has_one :taxon_splash, :autosave => true
end
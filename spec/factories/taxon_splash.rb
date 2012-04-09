FactoryGirl.define do
  factory :taxon_splash, :class => Spree::TaxonSplash do
    content "<h1>Hello World</h1>"

    # associations:
    taxon { |p| p.association(:taxon) }
  end
end
FactoryGirl.define do
  factory :taxon_splash, :class => Spree::TaxonSplash do
    content "<h1>Hello World</h1>"

    # associations:
    taxon { |p| p.association(:taxon) }
  end

  factory :taxon_splash_with_hierarchy, :parent => :taxon_splash do |f|
    taxon_parent = FactoryGirl.create :taxon, :name => "Category Root"

    3.times do |t|
      taxon_parent.children.find_or_create_by_name_and_taxonomy_id("Child #{t}", taxon_parent.taxonomy.id)
    end

    f.taxon taxon_parent
    content "<h1>Parent Splash</h1>"

    FactoryGirl.create :taxon_splash, :content => "<h1>Child Splash</h1>", :taxon => taxon_parent.children.sample
  end
end
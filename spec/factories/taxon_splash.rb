FactoryGirl.define do
  factory :taxon_splash, :class => Spree::TaxonSplash do
    content "<h1>Hello World</h1>"
    taxon
  end

  factory :taxon_splash_with_hierarchy, :parent => :taxon_splash do
    taxon_parent = FactoryGirl.create :taxon, :name => "#{Faker::Product.brand} Root"

    3.times do |t|
      tx = taxon_parent.children.find_or_create_by_name_and_taxonomy_id("#{Faker::Product.product_name} #{t}", taxon_parent.taxonomy.id)

      p = FactoryGirl.create :product
      p.taxons << tx
      p.save

      tx.reload
      tx.save
    end

    taxon taxon_parent
    content "<h1>Parent Splash</h1>"
  end

  factory :taxon_splash_with_hierarchy_and_child_splash, :parent => :taxon_splash_with_hierarchy do |t|
    after(:create) do |tx|
      FactoryGirl.create :taxon_splash, :content => "<h1>Child Splash</h1>", :taxon => tx.taxon.children.sample
      tx.reload
    end
  end
end
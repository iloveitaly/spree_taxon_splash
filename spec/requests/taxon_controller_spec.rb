require File.dirname(__FILE__) + '/../spec_helper'

describe Spree::TaxonsController do
  include Spree::Core::Engine.routes.url_helpers

  describe "#show" do
    it "should change taxon display when splash is defined" do
      t = FactoryGirl.create :taxon, :name => "New Taxon"
      get nested_taxons_path(t.permalink)
      response.body.should include(t.name)

      old_response = response
      s = FactoryGirl.create :taxon_splash, :taxon => t, :content => 'Unique Title'
      get nested_taxons_path(t.permalink)
      response.body.should_not == old_response.body
      response.body.should have_content(s.content)
    end

    it "should update product quantities correctly" do
      
    end

    it "should not modify search results" do
      # search results are routed through the taxon controller
    end
  end

  context "with child splash defined" do
  	before(:all) { @root_taxon_splash = FactoryGirl.create :taxon_splash_with_hierarchy_and_child_splash }
    after (:all) { @root_taxon_splash.destroy }

    it "should not display a product list on the parent taxon" do
      get nested_taxons_path(@root_taxon_splash.taxon.permalink)
      response.body.should have_content(@root_taxon_splash.children.sample.taxon.name)      
    end

    it "should display a product list on the child taxon with splash defined" do
      child_splash = @root_taxon_splash.children.sample
      get nested_taxons_path(child_splash.taxon.permalink)
      response.should have_content(child_splash.taxon.products.sample.name)
    end

    it "should not change the taxon display for child taxon with undefined splash" do
      
    end
  end

  context "without child splash defined" do
    before(:all) { @root_taxon_splash = FactoryGirl.create :taxon_splash_with_hierarchy }
    after(:all) { @root_taxon_splash.destroy }

  	it "should display a product list on the parent splash" do
  	  
  	end
    
    it "should not change the taxon display for child taxons" do
      response_body = []
      root_taxon = @root_taxon_splash.taxon

      root_taxon.children.each do |child|
        get nested_taxons_path(child.permalink)
        response_body << response.body
      end

      get nested_taxons_path(root_taxon.permalink)
      @root_taxon_splash.destroy

      root_taxon.children.each_with_index do |child, index|
        child.reload
        get nested_taxons_path(child.permalink)
        response.body.should == response_body[index]
      end
    end
  end
end
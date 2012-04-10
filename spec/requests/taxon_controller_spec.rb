require File.dirname(__FILE__) + '/../spec_helper'

describe Spree::TaxonsController do
  describe "#show" do
    it "should change taxon display when splash is defined" do
      t = FactoryGirl.create :taxon, :name => "New Taxon"
      get "/t/#{t.permalink}"
      response.body.should include("New Taxon")

      old_response = response
      s = FactoryGirl.create :taxon_splash, :taxon => t
      get "/t/#{t.permalink}"
      response.body.should_not == old_response.body
    end
  end

  context "with child splash defined" do
  	before {
  		@root_taxon_splash = FactoryGirl.create :taxon_splash_with_hierarchy
  	}

    it "should not display a product list on the parent taxon" do
      
    end

    it "should display a product list on the child taxon with splash defined" do
      get "/t/#{@root_taxon_splash.taxon.permalink}"
      response.should have_content("Product Components")
    end

    it "should not change the taxon display for child taxon with undefined splash" do
      
    end
  end

  context "without child splash defined" do
  	it "should display a product list on the parent splash" do
  	  
  	end
    
    it "should not change the taxon display for child taxons" do
      
    end
  end
end
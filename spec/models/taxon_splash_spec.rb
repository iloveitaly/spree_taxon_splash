require File.dirname(__FILE__) + '/../spec_helper'

describe Spree::TaxonSplash do
	# let(:taxon_splash) { Spree::TaxonSplash.new :content => "<h1>Hello World</h1>", :}

	context "validations" do
	  it { should have_valid_factory(:taxon_splash) }
	end

	context "when bundle products are manually defined" do
		
	end

	context "when bundle products are not defined" do
		false
	end

	context "when taxon splash has children" do
		it { should have_at_least(1).children }
	end

	context "when taxon splash has no children" do
		it { should have(0).children }
	end
end
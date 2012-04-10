require File.dirname(__FILE__) + '/../spec_helper'

describe Spree::TaxonSplash do
	let(:taxon_splash) { FactoryGirl.create(:taxon_splash) }

	context "validations" do
	  it { should have_valid_factory(:taxon_splash) }
	  it { should belong_to(:taxon) }
	  it { should have(0).children }
	end

	context "when bundle products are manually defined" do
		
	end

	context "when bundle products are not defined" do
		
	end

	context "when taxon splash has children" do
		subject { FactoryGirl.create(:taxon_splash_with_hierarchy) }
		
		it { should have(1).children }

		# it { subject.should have_at_least(1).children }

		# it "should not have the standard category page" do
		#   visit url_for(@taxon_parent)
		#   page.should have_content()
		# end
	end

	# context "when taxon splash has no children" do
	# 	subject { FactoryGirl.build :taxon_splash }
	# 	it { should have(0).children }
	# end
end
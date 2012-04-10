require File.dirname(__FILE__) + '/../spec_helper'

describe Spree::TaxonSplash do
	let(:taxon_splash) { FactoryGirl.create(:taxon_splash) }

	context "validations" do
	  it { should have_valid_factory(:taxon_splash) }
	  it { should belong_to(:taxon) }
	  it { should have(0).children }

	  it "should automatically add / remove from taxon" do
	    s = FactoryGirl.create :taxon_splash
	    t = s.taxon
	    s.taxon.taxon_splash.should_not be_nil

	    s.destroy
	    t.reload

	    t.taxon_splash.should be_nil
	  end
	end

	context "when bundle products are manually defined" do
		
	end

	context "when bundle products are not defined" do
		
	end

	context "when taxon splash has no children" do
    before(:all) { @taxon_splash = FactoryGirl.create(:taxon_splash_with_hierarchy) }
    after(:all) { @taxon_splash.destroy }
	  subject { @taxon_splash }

	  it { should have(0).children }
	  it { subject.taxon.taxon_splash.should_not be_nil }
	  its(:is_leaf?) { should be_true }
	end

	context "when taxon splash has children" do
		subject { FactoryGirl.create(:taxon_splash_with_hierarchy_and_child_splash) }
		after(:all) { subject.destroy }

		it { should have(1).children }
		its(:is_leaf?) { should be_false}
	end
end
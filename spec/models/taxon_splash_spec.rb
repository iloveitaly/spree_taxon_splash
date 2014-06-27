require 'spec_helper'

describe Spree::TaxonSplash do
	let(:taxon_splash) { FactoryGirl.create(:taxon_splash) }

	context "validations" do
	  it { taxon_splash.taxon.should_not be_nil }
	  it { taxon_splash.children.size.should == 0 }

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

	  it { subject.children.size.should == 0 }
	  it { subject.taxon.taxon_splash.should_not be_nil }
	  it { subject.is_leaf?.should == true }
	end

	context "when taxon splash has children" do
		subject { FactoryGirl.create(:taxon_splash_with_hierarchy_and_child_splash) }
		after(:all) { subject.destroy }

		it { subject.children.size.should == 1 }
		it { subject.is_leaf?.should == false }
	end
end
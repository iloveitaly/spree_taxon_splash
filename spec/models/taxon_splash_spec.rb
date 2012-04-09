require File.dirname(__FILE__) + '/../spec_helper'

describe Spree::TaxonSplash do
	let(:taxon_splash) { FactoryGirl(:taxon_splash) }

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
		before {
			# create taxon structure
			@taxon_parent = FactoryGirl.create :taxon, :name => "Category Root"

			3.times do |t|
				@taxon_parent.children.find_or_create_by_name_and_taxonomy_id("Child #{t}", @taxon_parent.taxonomy.id)
			end

			# create taxon splash with child splash
			# @taxon_splash = Factory.create :taxon_splash, :taxon => @taxon_parent
			@taxon_splash = FactoryGirl.create :taxon_splash, :taxon => @taxon_parent

			FactoryGirl.create :taxon_splash, :content => "<h1>A Subsplash!</h1>", :taxon => @taxon_parent.children.sample
		}

		subject { @taxon_splash }

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
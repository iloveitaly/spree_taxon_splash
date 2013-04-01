module Spree
  class TaxonSplash < ActiveRecord::Base
    belongs_to :taxon, :autosave => true
    validates_presence_of :taxon
    attr_accessible :taxon_id, :content
    
    def is_leaf?
      children.count == 0
    end

    def children
      taxon.children.select { |c| not c.taxon_splash.nil? }.map { |c| c.taxon_splash }
    rescue
      []
    end 
  end
end

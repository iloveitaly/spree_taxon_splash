class CreateTaxonSplashes < ActiveRecord::Migration
  def up
  	create_table :spree_taxon_splashes do |t|
  		t.references :taxon
  		t.text :content
  	end

  	add_index :spree_taxon_splashes, :taxon_id, :name => 'index_taxon_splashes_on_taxon_id'
  end

  def down
  	drop_table :spree_taxon_splashes
  end
end

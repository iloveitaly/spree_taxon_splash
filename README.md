Customized Taxon / Category Product Listing: spree_taxon_splash
===========================================

Ability to create customized splash pages for taxon displays: instead of displaying a simple product listing,
you can specify your own HTML completely or display a 'bundle listing' (a cart-like listing of all the products in the taxon).  

This extension was handled to provide some very customized functionality: this should provide a starting point for anyone
looking for a highly customized category display, but it may not be very useful out of the box.  

For example, I've customized the `splash.html.erb` in a theme extension to include Mustache rendering and a even more customized bundle display.

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test_app
    $ bundle exec rspec spec

Note that there are still some missing test cases.  

Copyright (c) 2012 Michael Bianco (@iloveitaly), released under the New BSD License

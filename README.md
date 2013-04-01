Custom Taxon / Category Display for Spree Commerce
==================================================

Ability to create customized splash pages for taxon displays.
Instead of displaying a simple product listing, you can specify your own HTML completely or display a 'bundle listing' (a cart-like listing of all the products in the taxon).  

This extension was created to provide some very customized functionality.
The goal is to provide a starting point for anyone looking for a highly customized category display,
but it may not be very useful out of the box.  

`Spree::TaxonSplash#content` is rendered in `splash.html.erb`.
The admin interface allows you to create a splash page for a taxon and assign the HTML content that will be rendered.

If you want to do anything fancy (like partial rendering, or markdown parsing, etc) you can modify the splash.html.erb file.

Copy `splash.html.erb` to `app/views/spree/taxons`.
You can use that as a starting point for customizing your taxon splash page.

Installation
------------
```ruby
# Gemfile
gem 'spree_taxon_splash', :github => 'iloveitaly/spree_taxon_splash'
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test_app
    $ bundle exec rspec spec

Note that there are still some missing test cases.  

Copyright (c) 2012 Michael Bianco (@iloveitaly), released under the New BSD License

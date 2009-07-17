= Spree Single Product Urls

http://github.com/spree-single-product-urls

An extension for Spree to minimize duplicate content issues by giving each 
product a single URL.

Features:

* 301 redirects from taxon-aware product URLs, for example:

  http://demo.spreecommerce.com/t/brands/ruby/p/ruby-baseball-jersey
  would 301 redirect to
  http://demo.spreecommerce.com/products/ruby-baseball-jersey

* Handles Taxons like Amazon: no breadcrumbs at the top of the product page; 
  they are replaced with a "Look for similar items" section
  lower down the page showing all taxons this product belongs to.

* The taxon-aware product URLs are no longer used in the product listings pages



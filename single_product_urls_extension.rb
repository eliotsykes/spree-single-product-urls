require_dependency 'application_controller'

class SingleProductUrlsExtension < Spree::Extension
  version "1.0"
  description "To minimize duplicate content issues, gives each product a single
    URL, the taxons with product URLs are redirected to the product URLs which 
    contain no taxon information. Behaves like Amazon where products don't have 
    breadcrumbs and taxons are shown under 'Look for similar items'."
    url "http://github.com/eliotsykes/single-product-urls"

  def activate

    ProductsHelper.class_eval do
      def taxon_crumbs(taxon, separator="&nbsp;&raquo;&nbsp;")
        crumbs = []
        crumbs << taxon.ancestors.reverse.collect { |ancestor| content_tag(:li, link_to(ancestor.name , seo_url(ancestor)) + separator) } unless taxon.ancestors.empty?
        crumbs << content_tag(:li, link_to(taxon.name , seo_url(taxon)))
        crumb_list = content_tag(:ul, crumbs)
        content_tag(:div, crumb_list + content_tag(:br, nil, :class => 'clear'), :class => 'breadcrumbs')
      end
    end
    
    ProductsController.class_eval do
      append_before_filter :redirect_taxons_with_product_urls_to_product_url, :only => :show
      
      private
      def redirect_taxons_with_product_urls_to_product_url
        if @taxon
          product = object
          redirect_to product, :status=>301
        end
      end
      
    end

  end
end

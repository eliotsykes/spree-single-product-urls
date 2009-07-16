class SingleProductUrlsExtension < Spree::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/single_product_urls"

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

  end
end

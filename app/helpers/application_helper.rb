module ApplicationHelper
    def collection_select_with_data(collection, value_method, text_method, options = {}, html_options = {})
      options_for_select = collection.map do |item|
        [
          item.send(text_method),
          item.send(value_method),
          { "data-product-price" => item.price.to_f } # Adiciona o preço como atributo data
        ]
      end
  
      select_tag(html_options[:name], options_for_select(options_for_select, options[:selected]), html_options)
    end
end
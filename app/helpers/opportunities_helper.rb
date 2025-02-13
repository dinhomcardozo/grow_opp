module OpportunitiesHelper
    def collection_select_with_data(collection, value_method, text_method, options = {}, html_options = {})
        options[:include_blank] ||= "Selecione um produto"
        collection_select(nil, value_method, collection, value_method, text_method, options, html_options)
    end
end
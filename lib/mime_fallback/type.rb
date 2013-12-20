module MimeFallback # :nodoc:
  
  # a hash of Mime::Type.to_sym.to_s => array of mime type fallbacks. 
  FALLBACKS = {}

  class Type < ::Mime::Type
    @register_callbacks = []
    
    class << self
      def register_alias(string, symbol, extension_synonyms = [], fallbacks = [])
        FALLBACKS[symbol.to_s] = Array(fallbacks).map {|s| Mime::Type.lookup_by_extension(s.to_s) } unless Array(fallbacks).empty?
        super(string, symbol, extension_synonyms)
      end
      
      def fallbacks(extension)
        Array(FALLBACKS[extension.to_s])
      end
    end
  end
end
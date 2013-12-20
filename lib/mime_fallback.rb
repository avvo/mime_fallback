require 'rails'

module MimeFallback
  autoload :NegotiationExtensions, "mime_fallback/negotiation_extensions"
  autoload :Resolver, "mime_fallback/resolver"
  autoload :Type, "mime_fallback/type"
end

require 'mime_fallback/railtie'
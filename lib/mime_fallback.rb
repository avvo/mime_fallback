require "rails"

module MimeFallback
  autoload :Resolver, "mime_fallback/resolver"
  autoload :Type, "mime_fallback/type"
end

require "mime_fallback/railtie"
require "mime_fallback/mime_negotiation"
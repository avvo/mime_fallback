# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register_alias "text/html", :iphone

MimeFallback::Type.register_alias "text/html", :mobile, [], :html

# Rails doesn't handle wildcard mime types, so we need to hardcode
# this as an alias to html so we don't 404.
# Mime::LOOKUP['text/*'] = Mime::HTML
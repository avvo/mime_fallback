module MimeFallback
  class Railtie < ::Rails::Railtie
    config.mime_fallback = ActiveSupport::OrderedOptions.new
    config.mime_fallback.view_path = "app/views"

    initializer "mime_fallback" do |app|
      ActiveSupport.on_load(:action_controller) do
        ActionDispatch::Http::MimeNegotiation.send(:include, MimeFallback::NegotiationExtensions)
        append_view_path MimeFallback::Resolver.new(File.join(app.root, app.config.mime_fallback.view_path))
      end
    end

  end
end
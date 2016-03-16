module MimeFallback
  class Resolver < ::ActionView::FileSystemResolver

    private

    def find_templates(name, prefix, partial, details, outside_app_allowed = false)
      format = Array(details[:formats]).first
      fallbacks ||= MimeFallback::Type.fallbacks(format).dup
      if fallbacks.present?
        fallback_details = details.dup
        fallback_details[:formats] = Array(format.to_sym) + fallbacks.map(&:to_sym)
        path = build_path(name, prefix, partial)
        query(path, fallback_details.select {|key| EXTENSIONS.include?(key)}, fallback_details[:formats], outside_app_allowed)
      else
        super(name, prefix, partial, details, outside_app_allowed)
      end
      
    end

  end
end

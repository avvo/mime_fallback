module MimeFallback
  module NegotiationExtensions
    extend ActiveSupport::Concern

    included do
      alias_method_chain :negotiate_mime, :mime_fallback
    end

    # Override to support mime type fallbacks
    def negotiate_mime_with_fallback(order)
      formats.each do |priority|
        if priority == Mime::ALL
          return order.first
        else
          # Try to find an exact match to what we're responding to
          types = Array(priority) + MimeFallback::Type.fallbacks(priority.to_sym)
          types.each do |fallback|
            return fallback if order.map(&:to_sym).include?(fallback.to_sym)
          end
          
          if order.include?(priority)
            return priority
          end
        end
      end
      
      order.include?(Mime::ALL) ? formats.first : nil
    end

  end
end
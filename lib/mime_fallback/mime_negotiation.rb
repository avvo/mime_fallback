# This overrides the behavior of negotiating mime. Doing this because we
#   aren't able to hook into ActionDispatch::Request
# This allows the fallbacks to work when you call respond_to {|format| format.something_with_a_fallback }
module ActionDispatch
  module Http
    module MimeNegotiation

      # Override to support mime type fallbacks
      def negotiate_mime(order)
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
end
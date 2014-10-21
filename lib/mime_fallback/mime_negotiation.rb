# This overrides the behavior of negotiating mime. Doing this because we
#   aren't able to hook into ActionDispatch::Request
# This allows the fallbacks to work when you call respond_to {|format| format.something_with_a_fallback }
module ActionDispatch
  module Http
    module MimeNegotiation

      # Override to support mime type fallbacks
      def negotiate_mime(order)
        # make search easier later
        responding_formats = order.index_by(&:to_sym)

        # formats are the request's formats
        formats.each do |priority|
          return order.first if priority == Mime::ALL

          # Try to find an exact match to what we're responding to
          types = Array(priority) + MimeFallback::Type.fallbacks(priority.to_sym)
          fallback = types.detect{|type| responding_formats.has_key?(type.to_sym)}
          return fallback if fallback

          # we've found an exact match
          return priority if responding_formats.has_key?(priority.to_sym)
        end

        order.include?(Mime::ALL) ? formats.first : nil
      end
    end
  end
end
module Knock
  module RateLimit
    extend ActiveSupport::Concern

    included do
      class_attribute :throttle_name, default: 'web/ip'
      after_action :set_throttle_headers
    end

    module ClassMethods
      def rate_limit(name)
        self.throttle_name = name
      end
    end

    private

    def set_throttle_headers
      throttle_headers.each { |k, v| response.set_header(k, v) }
    end

    def throttle_headers
      @_throttle_headers ||= -> {
        data = throttle_data[throttle_name]
        return {} if data.nil?
        {
          'X-RateLimit-Limit'     => data[:limit],
          'X-RateLimit-Remaining' => data[:limit].to_i - data[:count].to_i,
          'X-RateLimit-Resource'  => throttle_name,
          'X-RateLimit-Reset'     => data[:epoch_time],
          'X-RateLimit-Used'      => data[:count]
        }.compact
      }.()
    end

    def throttle_data
      @_throttle_data ||= request.env['rack.attack.throttle_data']
    end
  end
end

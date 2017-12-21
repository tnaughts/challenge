require 'json'

module Services
  module Pivotal
    class Requestor
      attr_reader :resource, :url

      def initialize (resource = nil, url = ENV['PIVOTAL_URL'])
        @resource = resource
        @url = url
      end

      def process
        p "#{url}/#{resource}"
        make_call_parsed("#{url}/#{resource}")
      end

      def make_call_parsed(url)
        response = RestClient.get url, pivotal_headers
        JSON.parse(response)
      end

      def pivotal_headers
        { 'X-TrackerToken' => ENV['PT_TOKEN'] }
      end
    end
  end
end

require "uri"
require "net/http"

module USNO
  module Transit
    module  Request
      private
      def request_response
        response = Net::HTTP.start(@uri.host) do |http|
          request = Net::HTTP::Post.new(@uri.path)

          http_headers.map { |k, v| request[k] = v }
          request.body = request_body

          http.request request
        end
      end

      def start_date
        @date.strftime("xxy=%Y&xxm=%m&xxd=%d")
      end

      def http_headers
        {
          "Accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
          "Accept-Language" => "en-US,en;q=0.5",
          "Accept-Encoding" => "gzip, deflate",
          "Referer" => "http://aa.usno.navy.mil/data/docs/mrst.php"
        }
      end
    end
  end
end


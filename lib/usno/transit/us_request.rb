require "uri"
require "net/http"

module USNO
  module Transit
    class USRequest < PayDirt::Base
      def initialize(options = {})
        options = {
          z_meters: 0,
          days: 5,
          date: Time.now,
          uri: URI.parse("http://aa.usno.navy.mil/cgi-bin/aa_mrst2.pl")
        }.merge(options)

        load_options(:city, :state, :days, :date, :obj, options)
      end

      def call
        return result(true, request_response.body)
      end

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

      def place
        "st=#{@state}&place=#{@city}&hh1=#{@z_meters}"
      end

      def request_body
        %W{
          FFX=1
          ID=AA
          #{start_date}
          rep=#{@days}
          obj=#{@obj}
          #{place}
          ZZZ=END
        }.join("&")
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

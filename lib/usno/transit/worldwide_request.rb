require "uri"
require "net/http"

module USNO
  module Transit
    class WorldWideRequest < PayDirt::Base
      def initialize(options = {})
        options = {
          uri: URI.parse("http://aa.usno.navy.mil/cgi-bin/aa_mrst2.pl"),
          z_meters: 0,
          days: 5,
          date: Time.now,
          lat_minutes: 0, lat_seconds: 0, long_minutes: 0, long_seconds: 0
        }.merge(options)


        load_options(:long_degrees, :lat_degrees, :days, :date, :object, options)
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
        %W{
          place=#{ @place || @city }
          #{elevation}
          #{coordinates}
        }.join("&")
      end

      def elevation
        "hh1=#{@z_meters}"
      end

      def coordinates
        %W{
          xx0=#{ sign_of(@long_degrees) }
          xx1=#{ @long_degrees }
          xx2=#{ @long_minutes }
          xx3=#{ @long_seconds }
          yy1=#{ @lat_degrees }
          yy2=#{ @lat_minutes }
          yy3=#{ @lat_seconds }
          yy0=#{ sign_of(@lat_degrees) }
        }.join("&")
      end

      def sign_of(int)
        int.zero? ? int.next : int / int.abs
      end

      def request_body
        %W{
          FFX=2
          ID=AA
          #{place}
          #{start_date}
          rep=#{@days}
          obj=#{@object}
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

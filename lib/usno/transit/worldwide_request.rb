require "uri"
require "net/http"

module USNO
  module Transit
    class WorldWideRequest < PayDirt::Base
      include USNO::Transit::Request

      def initialize(options = {})
        options = {
          uri: URI.parse("http://aa.usno.navy.mil/cgi-bin/aa_mrst2.pl"),
          z_meters: 0,
          days: 5,
          date: Time.now,
          lat_minutes: 0, lat_seconds: 0, long_minutes: 0, long_seconds: 0
        }.merge(options)


        load_options(:long, :lat, :days, :date, :object, options)
      end

      def call
        return result(true, request_response.body)
      end

      private
      def place
        %W{
          place=#{ @place || @city || "None given" }
          #{elevation}
          #{coordinates}
        }.join("&")
      end

      def elevation
        "hh1=#{@z_meters}"
      end

      def coordinates
        %W{
          xx0=#{ sign_of(@long) }
          xx1=#{ @long.abs }
          xx2=#{ @long_minutes }
          xx3=#{ @long_seconds }
          yy1=#{ @lat.abs }
          yy2=#{ @lat_minutes }
          yy3=#{ @lat_seconds }
          yy0=#{ sign_of(@lat) }
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
    end
  end
end

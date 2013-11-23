require "uri"
require "net/http"

module USNO
  module Transit
    class USRequest < PayDirt::Base
      include USNO::Transit::Request

      def initialize(options = {})
        options = {
          z_meters: 0,
          days: 5,
          date: Time.now,
          uri: URI.parse("http://aa.usno.navy.mil/cgi-bin/aa_mrst2.pl")
        }.merge(options)

        load_options(:city, :state, :days, :date, :object, options)
      end

      def call
        return result(true, request_response.body)
      end

      private
      def place
        "st=#{@state}&place=#{@city}&hh1=#{@z_meters}"
      end

      def request_body
        %W{
          FFX=1
          ID=AA
          #{start_date}
          rep=#{@days}
          obj=#{@object}
          #{place}
          ZZZ=END
        }.join("&")
      end
    end
  end
end

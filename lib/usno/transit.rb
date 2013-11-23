require "pay_dirt"
require_relative "transit/version"
require_relative "transit/states"
require_relative "transit/bodies"

require_relative "transit/request"
require_relative "transit/us_request"
require_relative "transit/worldwide_request"

module USNO
  module Transit
    class View < PayDirt::Base
      def initialize(options = {})
        raise "Cannot instantiate this class directly" if self.class.name.to_s =~ /View/

        options = form_options(options)

        load_options(options)
      end

      def call
        result(true, @request_class.new(@request_options).call.data)
      end

      private
      def form_options(options)
        options = {
          request_class: USNO::Transit::USRequest,
          object:        USNO::Transit::Bodies.fetch(self.class.name.to_s.split("::")[-1]),
          z_meters:      0,
          date:          Time.now,
          days:          5,
        }.merge(options)

        options.merge!({
          request_options: options.reject do |k,_|
            k.to_s == "request_class"
          end
        })
      end
    end

    class Sun            < View;end
    class Moon           < View;end
    class Mercury        < View;end
    class Venus          < View;end
    class Mars           < View;end
    class Jupiter        < View;end
    class Saturn         < View;end
    class Uranus         < View;end
    class Neptune        < View;end
    class Pluto          < View;end
    class Achernar       < View;end
    class Adhara         < View;end
    class Aldebaran      < View;end
    class Altair         < View;end
    class Antares        < View;end
    class Arcturus       < View;end
    class Betelgeuse     < View;end
    class Canopus        < View;end
    class Capella        < View;end
    class Deneb          < View;end
    class Fomalhaut      < View;end
    class Hadar          < View;end
    class Mimosa         < View;end
    class Polaris        < View;end
    class Pollux         < View;end
    class Procyon        < View;end
    class Regulus        < View;end
    class Rigel          < View;end
    class RigilKentaurus < View;end
    class Sirius         < View;end
    class Spica          < View;end
    class Vega           < View;end
  end
end

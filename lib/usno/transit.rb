require "pay_dirt"
require_relative "transit/version"
require_relative "transit/us_request"

module USNO
  module Transit
    BODIES = {
      "Sun" => 10, "Moon" => 11, "Mercury" => 1, "Venus" => 2,"Jupiter" => 5,
      "Mars" => 4, "Saturn" => 6, "Uranus" => 7, "Neptune" => 8, "Pluto" => 9,
      "Achernar" => -1, "Adhara" => -2, "Aldebaran" => -3, "Altair" => -4,
      "Antares" => -5, "Arcturus" => -6, "Betelgeuse" => -7, "Canopus" => -8,
      "Capella" => -9, "Deneb" => -10, "Fomalhaut" => -11, "Hadar" => -12,
      "Mimosa" => -13, "Polaris" => -14, "Pollux" => -15, "Procyon" => -16,
      "Regulus" => -17, "Rigel" => -18, "RigilKentaurus" => -19, "Vega" => -22,
      "Sirius" => -20, "Spica" => -21,
    }

    class View < PayDirt::Base
      def initialize(options = {})
        options = {
          request_class: USNO::Transit::USRequest,
          object: USNO::Transit::BODIES.fetch(self.class.name.split("::")[-1]) {
            raise "Celestial object not recognized"
          },
          state: "Alabama",#USNO::Transit::STATES.fetch(options[:state]) {
            #raise "US state not recognized"
          #},
          z_meters: 0,
          date: Time.now,
          days: 5,
        }.merge(options)

        load_options(:city, :state, options)
      end

      def call
        result(true, @request_class.new({
          obj: @object,
          city: @city,
          state: @state,
          z_meters: @z_meters,
          date: @date,
          days: @days
        }).call.data)

      end
    end

    class Sun < View;end
    class Moon < View;end
    class Mercury < View;end
    class Venus < View;end
    class Mars < View;end
    class Jupiter < View;end
    class Saturn < View;end
    class Uranus < View;end
    class Neptune < View;end
    class Pluto < View;end
    class Achernar < View;end
    class Adhara < View;end
    class Aldebaran < View;end
    class Altair < View;end
    class Antares < View;end
    class Arcturus < View;end
    class Betelgeuse < View;end
    class Canopus < View;end
    class Capella < View;end
    class Deneb < View;end
    class Fomalhaut < View;end
    class Hadar < View;end
    class Mimosa < View;end
    class Polaris < View;end
    class Pollux < View;end
    class Procyon < View;end
    class Regulus < View;end
    class Rigel < View;end
    class RigilKentaurus < View;end
    class Sirius < View;end
    class Spica < View;end
    class Vega < View;end
  end
end

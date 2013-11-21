module USNO
  module Transit
    module Bodies
      def self.fetch(k)
        self.hash.fetch(k) {
          raise "Celestial object not recognized - #{k} not found in #{self.hash.keys.join(', ')}"
        }
      end


      def self.hash
	{
	  "Sun"       =>  10, "Moon"           =>  11, "Mercury"   =>  1,
	  "Venus"     =>   2,"Jupiter"         =>   5, "Mars"      =>  4,
	  "Saturn"    =>   6, "Uranus"         =>   7, "Neptune"   =>  8,
	  "Pluto"     =>   9, "Achernar"       =>  -1, "Adhara"    =>  -2,
	  "Aldebaran" =>  -3, "Altair"         =>  -4, "Antares"   =>  -5,
	  "Arcturus"  =>  -6, "Betelgeuse"     =>  -7, "Canopus"   =>  -8,
	  "Capella"   =>  -9, "Deneb"          => -10, "Fomalhaut" => -11,
	  "Hadar"     => -12, "Mimosa"         => -13, "Polaris"   => -14,
	  "Pollux"    => -15, "Procyon"        => -16, "Regulus"   => -17,
	  "Rigel"     => -18, "RigilKentaurus" => -19, "Vega"      => -22,
	  "Sirius"    => -20, "Spica"          => -21,
        }
      end
    end
  end
end

module USNO
  module Transit
    class Client
      attr_accessor :konstants

      def initialize
        @konstants = []
        USNO::Transit::BODIES.each { |k,v| @konstants << instance_eval("class #{k}; def initialize() #{v} end; end") }
      end
    end
  end
end

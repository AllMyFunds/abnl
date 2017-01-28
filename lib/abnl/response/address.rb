class ABNL
  class Response
    class Address

      include XmlHelpers
      include EffectiveAttributes

      attr_reader :xml

      text_attribute :state, "state"
      text_attribute :postcode, "postcode"

      def initialize(xml)
        @xml = xml
      end

      def to_s
        "#{state} #{postcode}"
      end

    end
  end
end

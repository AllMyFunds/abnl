class ABNL
  class Response
    class GST
      include XmlHelpers
      include EffectiveAttributes

      attr_reader :xml

      def initialize(xml)
        @xml = xml
      end

      def to_s
        registered?.to_s
      end

    end
  end
end

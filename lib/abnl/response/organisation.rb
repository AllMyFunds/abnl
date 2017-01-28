class ABNL
  class Response
    class Organisation
      include XmlHelpers
      include EffectiveAttributes

      attr_reader :xml

      text_attribute :name, "organisationName"

      def initialize(xml)
        @xml = xml
      end

      def to_s
        name
      end

    end
  end
end

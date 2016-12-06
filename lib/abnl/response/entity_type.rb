class ABNL
  class Response
    class EntityType
      include XmlHelpers

      attr_reader :xml

      def initialize(xml)
        @xml = xml
      end

      text_attribute :code, "entityTypeCode"
      text_attribute :description, "entityDescription"

      def to_s
        description
      end

    end
  end
end

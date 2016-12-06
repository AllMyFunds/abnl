class ABNL
  class Response
    class EntityStatus
      include XmlHelpers

      attr_reader :xml

      def initialize(xml)
        @xml = xml
      end

      text_attribute :status, "entityStatusCode"
      date_attribute :effective_from, "effectiveFrom"
      date_attribute :effective_to, "effectiveTo"

      def to_s
        status
      end

    end
  end
end

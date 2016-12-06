class ABNL
  class Response
    class ABN
      include XmlHelpers

      attr_reader :xml

      def initialize(xml)
        @xml = xml
      end

      text_attribute :value, "identifierValue"
      bool_attribute :current, "isCurrentIndicator"
      text_attribute :replaced_value, "replacedIdentifierValue"
      date_attribute :replaced_from, "replacedFrom"

      def to_s
        value
      end

    end
  end
end

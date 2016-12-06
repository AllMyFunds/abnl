class ABNL
  class Response
    class DgrEndorsement
      include XmlHelpers

      attr_reader :xml

      def initialize(xml)
        @xml = xml
      end

      date_attribute :endorsed_from, "endorsedFrom"
      date_attribute :endorsed_to, "endorsedTo"
      text_attribute :endorsement, "entityEndorsement"
      text_attribute :item_number, "itemNumber"

      def registered?(date = Date.today)
        (endorsed_from != NIL_DATE || endorsed_from <= date) &&
          (endorsed_to == NIL_DATE || endorsed_to >= date)
      end

    end
  end
end

class ABNL
  class Response
    class GST
      include XmlHelpers

      attr_reader :xml

      def initialize(xml)
        @xml = xml
      end

      date_attribute :effective_from, "effectiveFrom"
      date_attribute :effective_to, "effectiveTo"

      def registered?(date = Date.today)
        (effective_from != NIL_DATE || effective_from <= date) &&
          (effective_to == NIL_DATE || effective_to >= date)
      end

      def to_s
        registered?.to_s
      end

    end
  end
end

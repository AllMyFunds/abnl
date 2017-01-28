class ABNL
  class Response
    class Individual
      include XmlHelpers
      include EffectiveAttributes

      attr_reader :xml

      text_attribute :full_name, "fullName"
      text_attribute :given_name, "givenName"
      text_attribute :other_given_name, "otherGivenName"
      text_attribute :family_name, "familyName"

      def initialize(xml)
        @xml = xml
      end

      def to_s
        full_name || [given_name, other_given_name, family_name].map { |n| n.to_s }.join(" ")
      end

    end
  end
end

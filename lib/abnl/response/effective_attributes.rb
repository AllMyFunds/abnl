class ABNL
  class Response
    module EffectiveAttributes

      def self.included(base)
        base.date_attribute :effective_from, "effectiveFrom"
        base.date_attribute :effective_to, "effectiveTo"
      end

      def registered?(date = Date.today)
        (effective_from != NIL_DATE || effective_from <= date) &&
          (effective_to == NIL_DATE || effective_to >= date)
      end

    end
  end
end

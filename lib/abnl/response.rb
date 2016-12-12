require "abnl/response/abn"
require "abnl/response/entity_status"
require "abnl/response/entity_type"
require "abnl/response/gst"
require "abnl/response/dgr_endorsement"

class ABNL
  class Response
    include XmlHelpers

    attr_reader :xml

    def initialize(xml)
      @xml = Oga.parse_xml(xml)
    end

    text_attribute :usage_statement, "usageStatement", :response
    date_attribute :date_register_last_updated, "dateRegisterLastUpdated", :response
    time_attribute :retrieved_at, "dateTimeRetrieved", :response
    date_attribute :record_last_updated, "recordLastUpdatedDate", :business_entity
    text_attribute :asic_number, "ASICNumber", :business_entity

    def abn
      @abn ||= ABN.new(business_entity.at_xpath("ABN"))
    end

    def status
      @status ||= EntityStatus.new(business_entity.at_xpath("entityStatus"))
    end

    def type
      @type ||= EntityType.new(business_entity.at_xpath("entityType"))
    end

    def gst
      @gst ||= GST.new(business_entity.at_xpath("goodsAndServicesTax"))
    end

    def dgr_endorsement
      @dgr_endorsement ||= DgrEndorsement.new(business_entity.at_xpath("dgrEndorsement"))
    end

    private

      def response
        @response ||= xml.at_xpath("//response")
      end

      def business_entity
        @business_entity ||= response.at_xpath("businessEntity201408")
      end

  end
end

class ABNL
  class Client

    class ApiError < StandardError
      attr_reader :response
      def initialize(response)
        @response = response
        super("#{response.code}: #{response.body}")
      end
    end

    BASE_URL = "http://abr.business.gov.au/abrxmlsearch/AbrXmlSearch.asmx"
    OPERATION = {
      search_by_abn: "SearchByABNv201408"
    }

    attr_reader :api_key

    def initialize(api_key:)
      @api_key = api_key
    end

    def find_by_abn(abn, history: false)
      response = request(
        :search_by_abn,
        searchString: abn,
        includeHistoricalDetails: boolean_param(history)
      )
    end

    private

      def request(operation, params = {})
        response = HTTP.get(
          "#{BASE_URL}/#{OPERATION.fetch(operation)}",
          params: params.merge(authenticationGuid: api_key)
        )

        case response.code
          when 200 then Response.new(response.body.to_s)
          else          raise ApiError.new(response)
        end
      end

      def boolean_param(value)
        value ? "Y" : "N"
      end

  end
end

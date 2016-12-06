require "http"
require "oga"

require "abnl/version"
require "abnl/xml_helpers"
require "abnl/response"
require "abnl/client"

class ABNL

  class << self
    extend Forwardable
    def_delegators :client, :find_by_abn

    attr_reader :client

    MUTEX = Mutex.new
    def configure(*args, **nargs)
      MUTEX.synchronize {
        @client = Client.new(*args, **nargs)
      }
    end
  end

end

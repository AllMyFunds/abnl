class ABNL
  module XmlHelpers

    NIL_DATE = Date.parse("0001-01-01").freeze

    def self.included(base)
      base.extend ClassMethods
    end

    def text(path, node = xml)
      node.at_xpath(path)&.text
    end

    def date(path, node = xml)
      str_date = text(path, node)
      unless str_date.nil?
        Date.iso8601(str_date)
      end
    end

    def time(path, node = xml)
      str_date = text(path, node)
      unless str_date.nil?
        Time.iso8601(str_date)
      end
    end

    def bool(path, node)
      str_bool = text(path, node)
      case str_bool
        when "Y" then true
        when "N" then false
        else          nil
      end
    end

    def find_node(node)
      case node
        when nil    then xml
        when Proc   then xml.call
        when Symbol then send(node)
      end
    end

    module ClassMethods
      def text_attribute(name, path, node = nil)
        define_method name do
          text(path, find_node(node))
        end
      end

      def date_attribute(name, path, node = nil)
        define_method name do
          date(path, find_node(node))
        end
      end

      def time_attribute(name, path, node = nil)
        define_method name do
          time(path, find_node(node))
        end
      end

      def bool_attribute(name, path, node = nil)
        define_method name do
          bool(path, find_node(node))
        end
      end
    end

  end
end

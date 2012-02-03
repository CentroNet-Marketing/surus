module Surus
  module Array
    class IntegerSerializer
      ARRAY_REGEX = %r{
        (?<=[\{,])                 (?# All elements are prefixed with either the opening brace or a comma)
        \-?\d+
        |
        NULL
      }x

      def load(string)
        return unless string
        string.scan(ARRAY_REGEX).map do |match|
          match == "NULL" ? nil : Integer(match)
        end
      end
      
      def dump(array)
        return unless array
        '{' + array.map { |s| format(s) }.join(",") + '}'
      end
      
      def format(value)
        value == nil ? "NULL" : value
      end
    end
  end  
end

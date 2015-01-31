require 'sorted'

module Sorted
  module ActionView
    class Builder
      attr_reader :params

      def initialize(order, params = {})
        @sort = ::Sorted::URIQuery.parse(params.delete(:sort))
        @order = ::Sorted::SQLQuery.parse(order)
        @params = params
        set = @order.direction_intersect(@sort)
        @params[:sort] = ::Sorted::URIQuery.encode(set)
      end

      def css
        if @sort.keys.include? @order.keys.first
          "sorted #{@sort.assoc(@order.keys.first).last}"
        else
          'sorted'
        end
      end
    end
  end
end

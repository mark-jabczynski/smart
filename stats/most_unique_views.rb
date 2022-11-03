require './visit'
require './stats/base'

module Stats
  class MostUniqueViews < Base
    def call
      views_number
        .sort_by(&:last)
        .last(number_of_tops)
        .reverse!
    end

    private

    def views_number
      @views_number ||= {}.tap do |hash|
        data
          .uniq { |v| v.page + v.ip }
          .each { |v| hash[v.page] = hash[v.page].to_i + 1 }
      end
    end
  end
end

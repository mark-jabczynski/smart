require './stats/base'

module Stats
  class MostViews < Base
    def call
      views_number
        .sort_by(&:last)
        .last(number_of_tops)
        .reverse!
    end

    private

    def views_number
      @views_number ||= {}.tap do |hash|
        data.each do |visit|
          hash[visit.page] = hash[visit.page].to_i + 1
        end
      end
    end
  end
end

require './reader'
require './stats/most_views'
require './stats/most_unique_views'

class Parser
  StatEngines = {
    'most_views' => Stats::MostViews,
    'most_unique_views' => Stats::MostUniqueViews,
  }

  def initialize(path:, operation:, number_of_tops: 5)
    @path = path
    @operation = operation
    @number_of_tops = number_of_tops
  end

  def call
    outcome = ''

    stats.each do |stat|
      outcome += "#{stat.first} #{stat.last} visits\n"
    end

    outcome
  end

  private

  attr_reader :path, :operation, :number_of_tops

  def data
    @data ||= Reader.new(path).call
  end

  def stats
    @stats ||= StatEngines[operation].new(data, number_of_tops).call
  end
end

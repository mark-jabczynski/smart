require 'csv'

require './visit'

class Reader
  def initialize(path)
    @path = path
    @visits = []
  end

  def call
    CSV.foreach(path, col_sep: ' ') do |row|
      visits.append(
        Visit.new(page: row[0], ip: row[1])
      )
    end

    visits
  end

  private

  attr_reader :path, :visits
end
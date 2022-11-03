module Stats
  class Base
    def initialize(data, number_of_tops)
      @data = data
      @number_of_tops = number_of_tops
    end

    def call
      raise NotImplementedError
    end

    private

    attr_reader :data, :number_of_tops
  end
end
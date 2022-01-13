# 運モジュール
module Fortune
  # 運の五行値の連続的変化
  class Gogyo
    include Enumerable

    attr_accessor :points, :results

    class Result
      include ActiveModel::Model
      include ActiveModel::Attributes

      attribute :range
      attribute :value

      def include?(date)
        range.include?(date)
      end

      def change(range)
        dup.tap { |result| result.range = range }
      end

      def +(other)
        self.value += other.value
        self
      end
    end

    def initialize
      super
      @points = []
      @results = []
    end

    def self.build(params)
      new.tap do |result|
        result.points = params.keys.map(&:min).flatten.uniq.sort
        result.points << (params.keys.map(&:max).max + 1.day)
        result.results = params.map { |range, value| Result.new(range: range, value: value) }
      end
    end

    def +(other)
      @points = (@points + other.points).flatten.uniq.sort
      this_results = separate(@points)
      other_results = other.separate(@points)

      @results = this_results.merge(other_results) { |_, old_val, new_val| old_val + new_val }.values
      self
    end

    def separate(new_points)
      points = new_points.dup
      @results.inject({}) do |new_results, result|
        points = points[points.find_index { |point| result.include?(point) }..]
        next new_results if points.nil?

        make_results(points, result, new_results)
      end
    end

    def make_results(points, value, result)
      points_in_range = points.take_while { |point| value.include?(point) }
      points -= points_in_range

      index = 0
      points_in_range.each_with_object(result) do |point, results|
        index += 1
        results[point] = Result.new(range: point...(points_in_range[index] || points[0]), value: value.value)
      end
    end

    def each(&block)
      @results.each(&block)
    end

    def filter_cover(range)
      filter { |result| result.range.max >= range.min && result.range.min <= range.max }
    end
  end
end

# 運モジュール
module Fortune
  # 運の五行値の連続的変化
  class Gogyo
    include Enumerable

    def initialize
      super
      @points = []
      @results = []
    end

    class Point
      include ActiveModel::Model
      include ActiveModel::Attributes

      attribute :range
      attribute :value
    end

    def add(params)
      params.is_a?(Array) ? params.each { |param| _add(param) } : _add(params)
      @results = _build_result
      self
    end

    def +(other)
      add(other.map { |range, value| { range: range, value: value } })
    end

    # 人を指定して
    # 日時を指定して
    # 読み取れる形に（五行値が整形処理を持っているので、それでいける）
    # 結果に対して配列形式でのアクセス
    private def _add(param)
      @points << Point.new(param)
    end

    private def _ranges
      keys = @points.flat_map {|point| point.range.min }.uniq.sort
      (0...(keys.length - 1)).map { |index| keys[index]...keys[index + 1] }
    end

    private def _build_result
      _ranges.to_h do |range|
        [range, @points.filter { |point| point.range.include?(range.first) }.sum(&:value)]
      end
    end

    def each(&block)
      @results.each(&block)
    end

    def filter_cover(range)
      filter { |date_range, _| date_range.max >= range.min && date_range.min <= range.max }
    end
  end
end

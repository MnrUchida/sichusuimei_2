module Pillar
  extend ActiveSupport::Concern

  included do
    include Kanshi

    belongs_to :person

    enum tenkan: {
      kinoe: 0, kinoto: 1, hinoe: 2, hinoto: 3, tsuchinoe: 4, tsuchinoto: 5, kanoe: 6, kanoto: 7, mizunoe: 8, mizunoto: 9
    }, _prefix: true
    enum chishi: {
      ne: 0, ushi: 1, tora: 2, u: 3, tatsu: 4, mi: 5, uma: 6, hitsuji: 7, saru: 8, tori: 9, inu: 10, i: 11
    }, _prefix: true
    enum zoukan: {
      kinoe: 0, kinoto: 1, hinoe: 2, hinoto: 3, tsuchinoe: 4, tsuchinoto: 5, kanoe: 6, kanoto: 7, mizunoe: 8, mizunoto: 9
    }, _prefix: true
  end

  def strength
    tenkan_hentsusei.strength.to_i + zoukan_hentsusei.strength + houn.strength
  end
end


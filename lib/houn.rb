class Houn < ActiveHash::Base
  self.data = [
    { key: :tai, distance: 7, strength: 0, name: '胎' },
    { key: :you, distance: 8, strength: 0, name: '養' },
    { key: :chosei, distance: 9, strength: 0, name: '長生' },
    { key: :mokuyoku, distance: 10, strength: 0, name: '沐浴' },
    { key: :kantai, distance: 11, strength: 1, name: '冠帯' },
    { key: :kenroku, distance: 0, strength: 1, name: '建禄' },
    { key: :teiou, distance: 1, strength: 1, name: '帝旺' },
    { key: :sui, distance: 2, strength: 0, name: '衰' },
    { key: :byo, distance: 3, strength: -1, name: '病' },
    { key: :shi, distance: 4, strength: -1, name: '死' },
    { key: :bo, distance: 5, strength: -1, name: '墓' },
    { key: :zetsu, distance: 6, strength: -1, name: '絶' },
  ]
end

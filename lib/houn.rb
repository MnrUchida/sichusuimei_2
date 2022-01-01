class Houn < ActiveHash::Base
  self.data = [
    { key: :tai, distance: 7, strength: 0 },
    { key: :you, distance: 8, strength: 0 },
    { key: :chosei, distance: 9, strength: 0 },
    { key: :mokuyoku, distance: 10, strength: 0 },
    { key: :kantai, distance: 11, strength: 1 },
    { key: :kenroku, distance: 0, strength: 1 },
    { key: :teiou, distance: 1, strength: 1 },
    { key: :sui, distance: 2, strength: 0 },
    { key: :byo, distance: 3, strength: -1 },
    { key: :shi, distance: 4, strength: -1 },
    { key: :bo, distance: 5, strength: -1 },
    { key: :zetsu, distance: 6, strength: -1 },
  ]
end

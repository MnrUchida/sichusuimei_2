class Hentsusei < ActiveHash::Base
  self.data = [
    { key: :hiken, relation: :same_kind, inyou: :same, strength: 1 },
    { key: :gouzai, relation: :same_kind, inyou: :different, strength: 1 },
    { key: :shokujin, relation: :support_to, inyou: :same, strength: -1 },
    { key: :shoukan, relation: :support_to, inyou: :different, strength: -1 },
    { key: :henzai, relation: :restraint_to, inyou: :same, strength: -1 },
    { key: :seizai, relation: :restraint_to, inyou: :different, strength: -1 },
    { key: :henkan, relation: :restraint_from, inyou: :same, strength: -1 },
    { key: :seikan, relation: :restraint_from, inyou: :different, strength: -1 },
    { key: :henin, relation: :support_from, inyou: :same, strength: 1 },
    { key: :inju, relation: :support_from, inyou: :different, strength: 1 },
  ]
end

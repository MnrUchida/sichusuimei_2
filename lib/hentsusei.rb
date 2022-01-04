class Hentsusei < ActiveHash::Base
  self.data = [
    { key: :hiken, relation: :same_kind, inyou: :same, strength: 1, name: '比肩' },
    { key: :gouzai, relation: :same_kind, inyou: :different, strength: 1, name: '劫財' },
    { key: :shokujin, relation: :support_to, inyou: :same, strength: -1, name: '食神' },
    { key: :shoukan, relation: :support_to, inyou: :different, strength: -1, name: '傷官' },
    { key: :henzai, relation: :restraint_to, inyou: :same, strength: -1, name: '偏財' },
    { key: :seizai, relation: :restraint_to, inyou: :different, strength: -1, name: '正財' },
    { key: :henkan, relation: :restraint_from, inyou: :same, strength: -1, name: '偏官' },
    { key: :seikan, relation: :restraint_from, inyou: :different, strength: -1, name: '正官' },
    { key: :henin, relation: :support_from, inyou: :same, strength: 1, name: '偏印' },
    { key: :inju, relation: :support_from, inyou: :different, strength: 1, name: '印綬' },
  ]
end

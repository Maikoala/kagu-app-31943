class Color < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ホワイト' },
    { id: 2, name: 'ブラック' },
    { id: 3, name: 'グレー' },
    { id: 4, name: 'ブラウン' },
    { id: 5, name: 'ベージュ' },
    { id: 6, name: 'グリーン' },
    { id: 7, name: 'ブルー' },
    { id: 8, name: 'レッド' },
    { id: 9, name: 'ピンク' },
    { id: 10, name: 'イエロー' },
    { id: 11, name: 'オレンジ' },
    { id: 12, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end

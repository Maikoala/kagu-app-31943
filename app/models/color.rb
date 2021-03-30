class Color < ActiveHash::Base
  self.data = [
    {id: 1, name: '--' },
    {id: 2, name: 'ホワイト' },
    {id: 3, name: 'ブラック' },
    {id: 4, name: 'グレー' },
    {id: 5, name: 'ブラウン' },
    {id: 6, name: 'ベージュ' },
    {id: 7, name: 'グリーン' },
    {id: 8, name: 'ブルー' },
    {id: 9, name: 'レッド' },
    {id: 10, name: 'ピンク' },
    {id: 11, name: 'イエロー' },
    {id: 12, name: 'オレンジ' },
    {id: 13, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
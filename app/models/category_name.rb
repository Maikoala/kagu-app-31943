class CategoryName < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ベッド&マットレス' },
    { id: 3, name: 'クッション、寝具' },
    { id: 4, name: 'ソファ' },
    { id: 5, name: 'カーテン' },
    { id: 6, name: 'テーブル、机' },
    { id: 7, name: 'イス、チェア' },
    { id: 8, name: 'テレビ台、リビング収納' },
    { id: 9, name: '本棚、シェルフ、収納家具' },
    { id: 10, name: 'ラグ、カーペット' },
    { id: 11, name: '照明' },
    { id: 12, name: 'キッチン収納' },
    { id: 13, name: '調理家具、食器' },
    { id: 14, name: '洗濯用品、掃除グッズ' },
    { id: 15, name: 'トイレ用品、バス用品' },
    { id: 16, name: 'インテリア雑貨、日用品' },
    { id: 17, name: '家電、電化製品' },
    { id: 18, name: '子供家具、ベビー用品' },
    { id: 19, name: 'ペット用品' },
    { id: 20, name: 'ガーデニング用品、ガーデンファニチャー' }
  ]

  include ActiveHash::Associations
  has_many :categories
end

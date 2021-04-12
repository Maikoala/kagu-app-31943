class CategoryName < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ベッド&マットレス' },
    { id: 2, name: 'クッション、寝具' },
    { id: 3, name: 'ソファ' },
    { id: 4, name: 'カーテン' },
    { id: 5, name: 'テーブル、机' },
    { id: 6, name: 'イス、チェア' },
    { id: 7, name: 'テレビ台、リビング収納' },
    { id: 8, name: '本棚、シェルフ、収納家具' },
    { id: 9, name: 'ラグ、カーペット' },
    { id: 10, name: '照明' },
    { id: 11, name: 'キッチン収納、ダイニングテーブル' },
    { id: 12, name: '調理家具、食器' },
    { id: 13, name: '洗濯用品、掃除グッズ' },
    { id: 14, name: 'トイレ用品、バス用品' },
    { id: 15, name: 'インテリア雑貨、日用品' },
    { id: 16, name: '家電、電化製品' },
    { id: 17, name: '子供家具、ベビー用品' },
    { id: 18, name: 'ペット用品' },
    { id: 19, name: 'ガーデニング用品、ガーデンファニチャー' },
    { id: 20, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :categories
end

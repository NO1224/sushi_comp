class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '赤身' },
    { id: 2, name: '白身' },
    { id: 3, name: '光りもの' },
    { id: 4, name: '煮もの' },
    { id: 5, name: '貝類' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :foods
end
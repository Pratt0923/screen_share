class Categoriesproject < ApplicationRecord
  has_many :chatrooms
  has_many :languages
end

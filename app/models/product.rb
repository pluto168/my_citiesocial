class Product < ApplicationRecord
  belongs_to :vendor

  #驗證
  validates :code, uniqueness: true
  validates :name, presence: true
  validates :list_price, :sell_price, numericality: {greater_than: 0, allow_nil: true}

  #搬移到app/models/concerns/code_generator.rb變成一個模組
  include CodeGenerator

  # #使用friend 搬移到app/models/concerns/code_generator.rb
  # extend FriendlyId
  # friendly_id :code_generator, use: :slugged, slug_column: :code

  # private
  # def code_generator        搬移到app/models/concerns/code_generator.rb
  #   SecureRandom.hex(10)    #產生10碼16進位的亂碼
  # end

end

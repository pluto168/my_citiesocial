class Product < ApplicationRecord
  
  #廠商
  belongs_to :vendor
  #分類,optional是可以不填,rails5以後是規定一定要填
  belongs_to :category, optional: true

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

  #paranoia軟刪除
  acts_as_paranoid

  #分頁
  paginates_per 10

  #文字編輯器
  has_rich_text :description     #有一個虛擬欄位:description 

  #Sku
  has_many :skus
  accepts_nested_attributes_for :skus, reject_if: :all_blank, allow_destroy: true   
      #reject_if空白就不能寫入,allow_destroy品項打錯或售完可以刪除

  #檔案上傳,不須另外開欄位,為虛擬欄位
  has_one_attached :cover_image
  
end

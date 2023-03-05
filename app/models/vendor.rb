class Vendor < ApplicationRecord
  validates :title, presence: true

  #paranoia軟刪除
  acts_as_paranoid
  
  #available,prodicts裏面_form裏面的Vendor.available
  scope :available, -> { where(online: true)}

  # def self.available
    #where(...)
  # end

  #分頁
  paginates_per 10
end

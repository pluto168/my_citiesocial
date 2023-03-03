module CodeGenerator
  extend ActiveSupport::Concern
  
  included do
    #使用friend
    extend FriendlyId
    friendly_id :code_generator, use: :slugged, slug_column: :code
  end

  private
  def code_generator
    SecureRandom.hex(10)    #產生10碼16進位的亂碼
  end

end


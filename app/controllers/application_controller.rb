class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :find_categories, unless: :backend?  #如果再後台就不撈

  private
  def record_not_found
    render  file: "#{Rails.root}/public/404.html",              #{Rails.root}是根目錄
            layout: false,    #不需要layout,例footer或頂端首頁...
            status: 404
  end

  def backend?
    controller_path.split('/').first == 'Astroser'
  end

  def find_categories
    @categories = Category.order(position: :asc)
  end
end

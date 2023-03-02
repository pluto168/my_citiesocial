class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private
  def record_not_found
    render  file: "#{Rails.root}/public/404.html",              #{Rails.root}是根目錄
            layout: false,    #不需要layout,例footer或頂端首頁...
            status: 404
  end
end

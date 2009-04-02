class StaticController < ApplicationController
  def show
    page = params[:path].join('-').downcase
    if static_page_exists? page
      render :action => page
    else
      render :action => '404', :status => 404
    end
  end
  
  private
  def static_page_exists? page
    FileTest.exists?(File.join(RAILS_ROOT, *%w[ app views static "#{page}" ]))
  end
end

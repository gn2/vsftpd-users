class StaticController < ApplicationController
  def show
    page = params[:path].join('-').downcase
    if static_page_exists? page
      render :action => page
    else
      render :action => '404', :status => 404
      if current_user
        statics_logger.info("#{Time.now} -- #{current_user.login}: Tried to access an inexisting page (#{request.request_uri})")
      else
        statics_logger.info("#{Time.now} -- A guest: Tried to access an inexisting page (#{request.request_uri})")
      end
    end
  end
  
  private
  def static_page_exists?(page)
    FileTest.exists?(File.join(RAILS_ROOT, %w[ app views static ], "#{page}.html.haml"))
  end
  
  # public
  # def index
  #   #Static.add_request(request.host, request.path, request.env['HTTP_REFERER'] || '')
  #   
  #   respond_to do |format|
  #     format.html { render :action => "404", :status => "404 Not Found"}
  #   end
  # end
  
  def statics_logger
    @@statics_logger ||= Logger.new("#{RAILS_ROOT}/log/statics.log")
  end
end

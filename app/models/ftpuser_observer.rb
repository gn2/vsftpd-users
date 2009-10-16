class FtpuserObserver < ActiveRecord::Observer
  def after_save(ftpuser)
    FtpuserMailer.deliver_changed_password_mails(ftpuser) if ftpuser.password_recently_changed?
  end
end
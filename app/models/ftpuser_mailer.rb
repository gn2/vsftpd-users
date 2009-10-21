class FtpuserMailer < ActionMailer::Base
  def self.deliver_changed_password_mails(ftpuser)
    recipients    = (ftpuser.group.users + User.admins).uniq#.collect{|u| "#{u.name} <#{u.email}>"}.uniq
    recipients.each do |r|
      FtpuserMailer.deliver_changed_password_mail(ftpuser, r)
    end
  end
  
  def changed_password_mail(ftpuser, recipient)
    setup()
    @recipients    = "#{recipient.name} <#{recipient.email}>"
    @subject      += "A password has changed"
    @body         = {:recipient_name => recipient.name, :login => ftpuser.login, :server => ftpuser.server.name, :group => ftpuser.group.name}
  end
      
  private
  def setup
    @from         = EMAILS_FROM
    @sent_on      = Time.now
    @subject      = EMAILS_SUBJECT_PREFIX
  end
end

class UserMailer < ActionMailer::Base
  def mail_for_a_new_password(user)
    setup(user)
    @subject      += "New password wanted"
    @body         = {:recipient_name => user.name, :recipient_token => user.perishable_token}
  end

  def mail_after_changed_password(user)
    setup(user)
    @subject      += "Your password has been changed"
    @body         = {:recipient_name => user.name}
  end
  
  private
  def setup(user)
    @from         = EMAILS_FROM
    @sent_on      = Time.now
    @subject      = EMAILS_SUBJECT_PREFIX
    @recipients   = "#{user.name} <#{user.email}>"
  end
end

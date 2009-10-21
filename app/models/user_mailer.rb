class UserMailer < ActionMailer::Base
  
  def mail_for_a_new_password(user)
    setup()
    @recipients   = "#{user.name} <#{user.email}>"
    @subject      += "New password wanted"
    @body         = {:recipient_name => user.name, :recipient_token => user.perishable_token}
  end

  private
  def setup
    @from         = EMAILS_FROM
    @sent_on      = Time.now
    @subject      = EMAILS_SUBJECT_PREFIX
  end
end

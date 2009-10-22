class UserObserver < ActiveRecord::Observer
    def after_save(user)
      UserMailer.deliver_mail_after_changed_password(user) if user.password_recently_changed?
    end
end
module MailerHelper
  def self.send_mail_to_user(user, subject, partial_name, password)
    Mailer.generic_message ({
      to: user.email,
      # if statement can be added here
      subject: subject,
      body: {
        user: user,
        password: password,
        first_name: ApplicationHelper.get_user_first_name(user),
        partial_name: partial_name
      }
    })
  end # we can have the instructor mailer here, since the users are sent a mail through this method

  def self.send_mail_to_all_super_users(super_user, user, subject)
    Mailer.request_user_message ({
      to: super_user.email,
      subject: subject,
      body: {
        super_user: super_user,
        user: user,
        first_name: ApplicationHelper.get_user_first_name(super_user),
      }
    })
  end
end

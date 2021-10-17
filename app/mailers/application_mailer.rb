class ApplicationMailer < ActionMailer::Base
  add_template_helper(EmailHelper)
end

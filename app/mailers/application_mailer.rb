class ApplicationMailer < ActionMailer::Base
  default from: 'notifications@flightbooker.com'
  layout 'mailer'
end

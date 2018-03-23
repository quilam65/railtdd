class ApplicationMailer < ActionMailer::Base
  default from: 'anhqui1995@gmail.com'
  layout 'mailer'

  def create_product product
    @product = product
    @url  = product_url(@product)
    mail(to: User.first.email, subject: 'Welcome to My Awesome Site')
  end
end

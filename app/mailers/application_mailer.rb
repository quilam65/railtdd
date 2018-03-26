class ApplicationMailer < ActionMailer::Base
  default from: 'anhqui1995@gmail.com'
  layout 'mailer'

  def create_product product
    @product = product
    @url  = product_url(@product)
    User.all.each do |u|
      mail(to: u.email, subject: 'Create product')
    end
  end
end

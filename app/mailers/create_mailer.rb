class CreateMailer < ApplicationMailer

  def create_mail(picture)
    @picture = picture

    mail to: "自分のメールアドレス", subject: "お問い合わせ確認メール"
  end
end

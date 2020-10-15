class QuestionMailer < ApplicationMailer
  default from: "qb.brady.121212@gmail.com"   # 送信元アドレス

  def received_email(question)
    @question = question
    # 送信先のメールアドレスを記述
    mail(:to => "qb.brady.121212@gmail.com", :subject => 'お問い合わせを承りました')
  end
end

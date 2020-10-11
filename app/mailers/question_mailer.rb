class QuestionMailer < ApplicationMailer
  default from: "qb.brady.121212@gmail.com"   # 送信元アドレス

  def received_email(question)
    @question = question
    mail(:to => question.email, :subject => 'お問い合わせを承りました')
  end
end

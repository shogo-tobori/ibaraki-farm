class QuestionMailer < ApplicationMailer
  default from: ENV['SEND_MAIL']   # 送信元アドレス

  def received_email(question)
    @question = question
    # 送信先のメールアドレスを記述
    mail(:to => ENV['SEND_MAIL'], :subject => 'お問い合わせを承りました')
  end
end

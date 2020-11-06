class Customers::QuestionsController < ApplicationController

  def new
    # 入力画面を表示
    @question = Question.new
    render :new
  end

  def confirm
    # 入力値のチェック
    @question = Question.new(question_params)
    if @question.valid?
      # OK。確認画面を表示
      render :confirm
    else
      # NG。入力画面を再表示
      render :new
    end
  end

  def thanks
    # メール送信
    @question = Question.new(question_params)
    QuestionMailer.received_email(@question).deliver

    # 完了画面を表示
    render :thanks
  end

  private
  def question_params
    params.require(:question).permit(:name, :email, :message)
  end

end

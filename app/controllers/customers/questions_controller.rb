class Customers::QuestionsController < ApplicationController

  def index
    # 入力画面を表示
    @question = Question.new
    render :action => 'index'
  end

  def confirm
    # 入力値のチェック
    @question = Question.new(question_params)
    if @question.valid?
      # OK。確認画面を表示
      render :action => 'confirm'
    else
      # NG。入力画面を再表示
      render :action => 'index'
    end
  end

  def thanks
    # メール送信
    @question = Question.new(question_params)
    QuestionMailer.received_email(@question).deliver

    # 完了画面を表示
    render :action => 'thanks'
  end

  private
  def question_params
    params.require(:question).permit(:name, :email, :message)
  end

end

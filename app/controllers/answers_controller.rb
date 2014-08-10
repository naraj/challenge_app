class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.question = @question

    if @answer.save
      AnswerMailer.delay.answer_email(current_user.id, @question)
      redirect_to question_path(@question), notice: "Answer was successfully created."
    else
      redirect_to question_path(@question), alert: "There was an error when adding answer."
    end
  end



  def like
    @answer = Answer.find(params[:id])
    if !current_user.flagged?(@answer)
      current_user.flag(@answer)
      user = User.find(id=@answer.user_id)
      user.change_points(5)
      user.save
    end
    redirect_to @question
  end


  def accept
    @answer = Answer.find(params[:id])
    if @question.user.id == current_user.id
      if !@question.answered and !@answer.accepted
        @answer.accepted = true
        user = User.find(id=@answer.user_id)
        user.change_points(25)

        @question.answered = true
        if user.save and @answer.save and @question.save
          AcceptedMailer.delay.accepted_email(@answer.user_id, @question)
          redirect_to question_path(@question), notice: "You successfully accepted the answer."
        else
          redirect_to question_path(@question), alert: "There was an error when accepting the answer."
        end
      end 
    end
  end


  private

    def set_question
      @question = Question.find(params[:question_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:contents)
    end
end

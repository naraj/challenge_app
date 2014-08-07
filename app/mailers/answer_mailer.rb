class AnswerMailer < ActionMailer::Base
  	default from: "example@email.com"
  	def answer_email(answer_user_id, question)
  		@answer_user = User.find(answer_user_id)
  		@question_user = User.find(question.user_id)
  		@question = question
  		mail(to: @question_user.email, subject: "Someone has posted an answer to your question.")


  	end
end

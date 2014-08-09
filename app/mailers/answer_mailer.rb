class AnswerMailer < ActionMailer::Base
  	default from: "notification@challengeapp.com"
  	def answer_email(answer_user_id, question)
  		@answer_user = User.find(answer_user_id)
  		@answer_user_url = user_url(@answer_user)
  		@question_user = User.find(question.user_id)
  		@question_url = question_url(question)
  		mail(to: @question_user.email, subject: "Someone has posted an answer to your question.")


  	end
end

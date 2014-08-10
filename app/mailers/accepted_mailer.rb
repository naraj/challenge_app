class AcceptedMailer < ActionMailer::Base
  default from: "notification@challengeapp.com"
  	def accepted_email(answer_user_id, question)
  		@answer_user = User.find(answer_user_id)
  		@answer_user_url = user_url(@answer_user)
  		@question_user = User.find(question.user_id)
  		@question_url = question_url(question)
  		mail(to: @answer_user.email, subject: "Someone has accepted your answer.")


  	end
end

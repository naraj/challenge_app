module SpecHelpers
  module Authorization
    def sign_in_as(user_id)
    	user = User.find(user_id)
		visit new_user_session_path
	    fill_in "user_email", with: user.email
	    fill_in "user_password", with: "password"
	    click_button "Sign in"
    end
  end
end

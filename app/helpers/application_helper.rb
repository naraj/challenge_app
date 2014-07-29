module ApplicationHelper
	def flash_class(type)
		
	    case type.to_s
		    when "alert"
		    	"alert-danger"
		    when "notice" 
		    	"alert-success"
		    when "success" 
		    	"alert-success"
		    when "error" 
		    	"alert-danger"
		    else
		    	type.to_s
	   	end
    end
end
